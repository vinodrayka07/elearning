import 'package:elearner/Models/Alluser_model.dart';
import 'package:elearner/app/data/apis/Api_Models/SimpleResponseModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class FriendsListPageController extends GetxController {
  //TODO: Implement FriendsListPageController
  Map<String, String?> data = Get.parameters;

  AllUserModel? allUserModel;
  SimpleResponseModel? simpleResponseModel;
  final count = 0.obs;
  bool isLoading = true;
  List<Result>? eventUserList = [];
  List<Result>? searchList = [];
  List<bool> selectedItems = [false];
  Set<int> selectedIndexes = {};
  @override
  void onInit() {
  //  Get.snackbar("Error", );
    getAllFriends();


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

  void increment() => count.value++;


  // Map<String, String> bodyParams = {
  //   ApiKeyConstants.userId: prefs.getString("userid") ?? "",
  //   ApiKeyConstants.eventId: data[ApiKeyConstants.eventId] ?? "",
  // };

  getAllFriends() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          allUserModel = await ApiMethods.allUserListApi(bodyParams: bodyParams);
          if (allUserModel != null && allUserModel?.status != '0') {
           // isLoading = false;
            eventUserList = allUserModel?.result;
            searchList = eventUserList;

            isLoading = false;
            increment();
            // image = (getEventDetails?.result?.favUsers?.first.image as List<String>?)!;

            // data = {
            //   ApiKeyConstants.categoryName: ,
            // };



             print("data is of result : ${isLoading.toString()} + ${allUserModel?.result?.first.firstName}");


            // Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            Get.snackbar("Error", allUserModel!.message ?? '');
            print("Error is of result : ${allUserModel!.message!}");
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading = false;
          //Get.snackbar(" ", "data ${dashboardData?.result}");
        } else{
          Get.snackbar("please", "Make sure on your Internet");
          print("Error is of result : ${allUserModel!.message!}");
        }
      } catch (e) {
        // showLoading = false;
        isLoading = false;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
       // Get.snackbar("please", e.toString());
        print("catch is of result : ${e.toString()}");
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }




  sendRequest(String id) async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
        ApiKeyConstants.requestId: id,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          simpleResponseModel = await ApiMethods.sendFollowRequestApi(bodyParams: bodyParams);
          if (simpleResponseModel != null && simpleResponseModel?.status != '0') {

            isLoading = false;
            print("request is of result : ${isLoading.toString()} + ${simpleResponseModel?.message}");
            getAllFriends();
            increment();


          } else {
            Get.snackbar("Error", simpleResponseModel!.message ?? '');
            print("Error is of result : ${simpleResponseModel!.message!}");

          }
          isLoading = false;
        } else{
          Get.snackbar("please", "Make sure on your Internet");
          print("Error is of result : ${simpleResponseModel!.message!}");
        }
      } catch (e) {
        isLoading = false;
        Get.snackbar("please", e.toString());
        print("catch is of result : ${e.toString()}");
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }
  unSendRequest(String id) async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
        ApiKeyConstants.requestId: id,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          simpleResponseModel = await ApiMethods.userUnFollowApi(bodyParams: bodyParams);
          if (simpleResponseModel != null && simpleResponseModel?.status != '0') {

            isLoading = false;
            print("request is of result : ${isLoading.toString()} + ${simpleResponseModel?.message}");
            getAllFriends();
            increment();


          } else {
            Get.snackbar("Error", simpleResponseModel!.message ?? '');
            print("Error is of result : ${simpleResponseModel!.message!}");

          }
          isLoading = false;
        } else{
          Get.snackbar("please", "Make sure on your Internet");
          print("Error is of result : ${simpleResponseModel!.message!}");
        }
      } catch (e) {
        isLoading = false;
        Get.snackbar("please", e.toString());
        print("catch is of result : ${e.toString()}");
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }


  void searchRecipes(String value) async {
    print(" add data :${value}");

    searchList = eventUserList
        ?.where(
            (item) => item.email!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
    increment();
    print(" get data :${searchList?.length}");


  }
}
