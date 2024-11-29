import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/friend_profile_model.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/get_user_model.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class ProfilePageController extends GetxController {
  //TODO: Implement ProfilePageController

 // getFriendProfileApi
  FriendProfileModel? friendProfileModel;
  bool? isLoading = false;
  List<Events>? eventUserList = [];
  UserModel? userModel;

  final count = 0.obs;
  @override
  void onInit() {
    getProfileData();
    getEventData();
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

  getEventData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "",
        ApiKeyConstants.eventId: "33",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          friendProfileModel = await ApiMethods.getFriendProfileApi(bodyParams: bodyParams);
          if (friendProfileModel != null && friendProfileModel?.status != '0') {
            isLoading = false;
            eventUserList = friendProfileModel?.result?[0].events;
            // print("zdjhgjh : ${
            //
            //     /friendProfileModel!.result?[0].events != null? 'dfsfg'}");
            // image = (getEventDetails?.result?.favUsers?.first.image as List<String>?)!;

            // data = {
            //   ApiKeyConstants.categoryName: ,
            // };


            // print("data is of result : ${item!.status!}");
            // print("data is of result : ${item.categoryName!}");
            increment();
            isLoading = false;
            // Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            Get.snackbar("Error", friendProfileModel!.message ?? '');
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading = false;
          //Get.snackbar(" ", "data ${dashboardData?.result}");
        } else{
          Get.snackbar("please", "Make sure on your Internet");
        }
      } catch (e) {
        // showLoading = false;
        isLoading = false;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please", e.toString());
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }


  getProfileData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          userModel = await ApiMethods.getProfile(bodyParams: bodyParams);
          if (userModel != null && userModel?.status != '0') {
            isLoading = false;

            //
            // print(userModel?.result?.firstName);
            // firstName = TextEditingController(text: userModel?.result?.firstName ?? "");
            // print(userModel?.result?.lastName);
            // lastName = TextEditingController(text: userModel?.result?.lastName ?? "");
            // print(userModel?.result?.dob);
            // dateOfBirth = TextEditingController(text: userModel?.result?.dob ?? "");
            // print(userModel?.result?.email);
            // email = TextEditingController(text: userModel?.result?.email ?? "");
            // print(userModel?.result?.mobile);
            // mobileNumber = TextEditingController(text: userModel?.result?.mobile ?? "");
            // print(userModel?.result?.gender);
            // selectedValueRecurring = userModel?.result?.gender ?? "ss" ;

            print(userModel?.result?.image);

            increment();


          } else {
            Get.snackbar("Error", userModel!.message ?? '');
          }

          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        Get.snackbar("please favorites..", e.toString());
        print("catch data: ${e.toString()} ");
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  void increment() => count.value++;
}
