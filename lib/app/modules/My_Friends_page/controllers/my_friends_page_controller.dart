import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/My_Friend_Model.dart';
import '../../../../Models/My_friend_request.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/SimpleResponseModel.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class MyFriendsPageController extends GetxController {
  //TODO: Implement MyFriendsPageController

  final count = 0.obs;
  int indexCategory = 1;
  int indexCategory2 = 0;
  bool isLoading = true;
  SimpleResponseModel? simpleResponseModel;
  bool isLoading2 = true;
  MyFriendModel? myFriendModel;
  MyFriendRequest? myFriendRequest;
  List<Result>? eventUserList = [];
  List<Result>? searchList = [];
  List<bool> selectedItems = [false];
  Set<int> selectedIndexes = {};


  @override
  void onInit() {
    getAllFriends();
    getAllRequest();
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

  getAllFriends() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId:  "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          myFriendModel = await ApiMethods.getMyFriendListApi(bodyParams: bodyParams);
          if (myFriendModel != null && myFriendModel?.status != '0') {
            // isLoading = false;
            eventUserList = myFriendModel?.result;
            searchList = eventUserList;

            isLoading = false;
            increment();



            print("data is of result : ${isLoading.toString()} + ${myFriendModel?.result?.first.userData?.id}");


            // Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            Get.snackbar("Error", myFriendModel!.message ?? '');
            print("Error is of result : ${myFriendModel!.message!}");
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading = false;
          //Get.snackbar(" ", "data ${dashboardData?.result}");
        } else{
          Get.snackbar("please", "Make sure on your Internet");
          print("Error is of result : ${myFriendModel!.message!}");
        }
      } catch (e) {
        // showLoading = false;
        isLoading = false;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        //Get.snackbar("please", e.toString());
        print("catch is of result : ${e.toString()}");
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  getAllRequest() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading2 = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId:  "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          myFriendRequest = await ApiMethods.getMyFriendRequestApi(bodyParams: bodyParams);
          if (myFriendRequest != null && myFriendRequest?.status != '0') {
            // isLoading = false;
            //eventUserList = myFriendRequest?.result?.cast<Result>();
          //  searchList = eventUserList;

            isLoading2 = false;
            increment();



            print("data is of result : ${isLoading2.toString()} + ${myFriendRequest?.result?.first.userData?.id}");


            // Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            Get.snackbar("Error", myFriendRequest!.message ?? '');
            print("Error is of result : ${myFriendRequest!.message!}");
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading2 = false;
          //Get.snackbar(" ", "data ${dashboardData?.result}");
        } else{
          Get.snackbar("please", "Make sure on your Internet");
          print("Error is of result : ${myFriendRequest!.message!}");
        }
      } catch (e) {
        // showLoading = false;
        isLoading2 = false;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
       // Get.snackbar("please", e.toString());
        print("catch is of result : ${e.toString()}");
      }
    } else {
      isLoading2 = false;
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
        ApiKeyConstants.id: id,
       // ApiKeyConstants.requestId: id,
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
        ApiKeyConstants.id: id,
      //  ApiKeyConstants.requestId: id,
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

  acceptRequest(String id) async {
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
          simpleResponseModel = await ApiMethods.acceptRequestApi(bodyParams: bodyParams);
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

  deleteRequest(String id) async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
        ApiKeyConstants.requestId: id,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          simpleResponseModel = await ApiMethods.deleteRequestApi(bodyParams: bodyParams);
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
            (item) => item.userData!.email!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
    increment();
    print(" get data :${searchList?.length}");


  }

  void increment() => count.value++;
}
