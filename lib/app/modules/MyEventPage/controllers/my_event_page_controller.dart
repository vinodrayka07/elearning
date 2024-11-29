import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/featured_model.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';
import '../../../routes/app_pages.dart';

class MyEventPageController extends GetxController {
  //TODO: Implement MyEventPageController

  final count = 0.obs;
  RxBool isLoading = true.obs;
  FeaturedModel? featuredModel;
  List<Result>? searchList = [];
  List<Result>? result = [];



  @override
  void onInit() {
    getFavData();
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


  getFavData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true.obs;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          featuredModel = await ApiMethods.getMyPublishEventApi(bodyParams: bodyParams);
          if (featuredModel != null && featuredModel?.status != '0') {
            result = featuredModel?.result;
            searchList = result;


            isLoading = false.obs;

            increment();


          } else {
            Get.snackbar("Error", featuredModel!.message ?? '');
          }

          isLoading = false.obs;
        }
      } catch (e) {
        isLoading = false.obs;
        Get.snackbar("please my event..", e.toString());
        print("catch data: ${e.toString()} ");
      }
    } else {
      isLoading = false.obs;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  void searchRecipes(String value) async {
    print(" add data :${value}");

    searchList = result
        ?.where(
            (item) => item.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
    increment();
    print(" get data :${searchList?.length}");


  }

  Future<void> clickOnItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> bodyParams = {
      ApiKeyConstants.userId: prefs.getString("userid") ?? "",
      ApiKeyConstants.eventId: featuredModel!.result![index].id ?? "106",
    };
    Get.toNamed(Routes.EVENT_DETAILS_PAGE,parameters: bodyParams,arguments: true);


  }





  void increment() => count.value++;
}
