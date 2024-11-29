import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/SearchHistory_model.dart';
import '../../../../Models/getEvents.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';
import '../../../routes/app_pages.dart';

class SearchListViewController extends GetxController {
  //TODO: Implement SearchListViewController


  final count = 0.obs;
  FocusNode? focusNode;
  final listValue = 0.obs;
  GetEvents? eventData;
  bool? isLoading = true;
  List<Result>? searchList = [];
  List<Result>? result = [];
  SearchHistoryModel? addSearchHistory;

  List<bool> selectedItems = [false];
  Set<int> selectedIndexes = {};

  final like = 0.obs;

  @override
  void onInit() {
    getDashboardData();
    focusNode = FocusNode();
    focusNode?.addListener(
            () => print('focusNode updated: hasFocus: ${focusNode?.hasFocus}'));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void setFocus() {
    FocusScope.of(Get.context!).requestFocus(focusNode);
    print('focusNode updated: hasFocus: ${focusNode?.hasFocus}');
  }
  void unFocus() {
    focusNode?.unfocus();
    print('focusNode updated: hasFocus: ${focusNode?.hasFocus}');
    focusNode?.addListener(
            () => print('focusNode updated: hasFocus: ${focusNode?.hasFocus}'));
  }

  getDashboardData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "",
      };
      try {
        eventData = await ApiMethods.getAllEventApi(bodyParams: bodyParams);
        if (eventData != null && eventData?.status != '0') {

          // Map<String, String> data = {
          //   ApiKeyConstants.mobile: MobileNumber.text,
          //   ApiKeyConstants.countryCode: dialcode,
          // };
          //
          final item = eventData?.result?[0];
          print("data is of result : ${item!.address!}");
          print("data is of result : ${item.dateTime!}");
          result = eventData?.result;
          searchList = result;
          isLoading = false;
          listValueLoad();
          increment();
          // Get.toNamed(Routes.OTP_PAGE, parameters: data);
        } else {

          Get.snackbar("Error", eventData!.message ?? '');
          //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
          // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
        }
        // showLoading = false;
        isLoading = false;
        //Get.snackbar(" ", "data ${dashboardData?.result}");
      } catch (e) {
        // showLoading = false;
        isLoading = false;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please Search list", 'Enter unique email and phone number...');
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }
  addHistoryData(String name, String eventId, int index) async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("userid"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid")!,
        ApiKeyConstants.name: name,
        ApiKeyConstants.eventId: eventId,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          addSearchHistory = await ApiMethods.addSearchHistoryApi(bodyParams: bodyParams
          );
          if (addSearchHistory != null && addSearchHistory?.status != '0') {
            isLoading = false;
            print("data is loading : ${addSearchHistory?.result![0].name}");

            increment();
          } else {
            Get.snackbar("Error", addSearchHistory!.message ?? '');

          }
          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        print(e);
        // Get.snackbar("please", '$e');
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }

  void searchRecipes(String value) async {
    print(" add data :${value}");

    searchList = result
        ?.where(
            (item) => item.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
    listValueLoad();
    print(" get data :${searchList?.length}");


  }

  void increment() => count.value++;

  void listValueLoad() => listValue.value++;

  void likeIncrement() => like.value++;

  Future<void> clickOnItem(int index, String id , String name) async {

    addHistoryData(name,id,index);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> bodyParams = {
      ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      ApiKeyConstants.eventId: eventData?.result?[index].id ?? "",
    };
    Get.toNamed(Routes.EVENT_DETAILS_PAGE,parameters: bodyParams);


  }
}
