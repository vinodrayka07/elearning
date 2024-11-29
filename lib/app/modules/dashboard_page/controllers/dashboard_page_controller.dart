import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:elearner/Models/DashboardData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/SimpleResponseModel.dart';
import '../../../data/apis/Api_Models/get_user_model.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';
import '../../../routes/app_pages.dart';

class DashboardPageController extends GetxController {
  bool isLoading = true;
  DashboardData? dashboardData;
  SimpleResponseModel? simpleResponseModel;
  List<bool> selectedItems = [false];
  Set<int> selectedIndexes = {};
  FocusNode? focusNode;
  UserModel? userModel;
  late Map<String, String> data;

  final count = 0.obs;
  final like = 0.obs;

  BuildContext? get context => Get.context;

  @override
  void onInit() {
    getProfileData();
    getDashboardData();
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

  // Future<String> getAccessToken() async {
  //   // Your client ID and client secret obtained from Google Cloud Console
  //   final serviceAccountJson = {
  //     "type": "service_account",
  //     "project_id": "elearner-131f1",
  //     "private_key_id": "fe2b5d9815d89f55496eb562a9b1b3ca6891dc67",
  //     "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDNNSlDHufrFme4\nZ2abjhtLxcC2gwVSmA6IMEwSh3s6J2R6yEgR/lXjrVYpqqel8R1gfc49tPYEBamh\nn3u8hMR70SLtEL/o1KBELTfEdpDvHEZLP+kIMm9X5ND4P2Z2kdXRbEx/h0XmSJaX\nOjF8BfVFITBiFaSsDlkeiBb9davKALFowRqIuzTRfsv3JegpQR9IPzzmDs+tKhem\nKNdmim50jSwHZhAkyD2EcHGQxeakEs4vOLwcf9czXS57S9oItUtvVGFvQXJJj47F\nv3krg/zCqu/eWPra4n0nlXCnjZ6nscyYJOFiYmEaIRmSf9Tz558U8pbO9qR9X9OH\n74X5TP/ZAgMBAAECggEAEGUS6t3pQYsEtmLse7kazS77epl1L2geoRrauRBB9B95\nk6W0vFtJmWsb2zBbPJLK+g6TD7MJhMC/EL6hMCqbWBkZZT9VVdDHDStfrT6bzb7A\njvqIL7N32dnaKDtIgGieYKD6a6XvG7ro7SQlF/eR5PgF2ZBJG8X5sMrGq3FfTEAl\nLGFxqg/0qGgjOt/jzKfRd5DFy4NVRXFtroZJn5cD1EPXHb5X+LENO/skxCoSjolU\nMvh65l5rJXK6ggN8v9KHL5vKIEB3gu2rBaf3oovyi4QQVQwK49PRLarbEU16DMpG\nHAnb9h2oHLuvpYelymUdODuYycoTz9AC0cb28pssAQKBgQD5B0SoU6XGWnlbZakU\nb5XLWP6baTAmFhKeQTFc/jiVHwtCXuqExqWALeB3U2+OyLrMKoq4q0ampHh7WIaV\neyk8207pV8LpJXFPkMuvm/4ueeL8vt3VjyatfYtABSm8HjYus4MV7BBmpjEGJEsk\nWsr8j7Vdz+OG1vZLS0ToDVG2uQKBgQDS89blB9P6eYZWaQw+erb1TyrbKqzzFhRj\nTCGErk1hGB1rolk8Z6snFy31+I3AdN8DLVMti8Gfc9AqybBnAcAgd1KiVSrX/CoU\nzSeMz7CVAj+lO23Zne+WfEZjq44o1MLblHM/07khQRmEmwaRmSpX8VlVrWHaFhdD\ns0oqdY8CIQKBgQCy4FCl5GfIYcaYKx7XagucJFHGijkmsmYvPL7bgFRecQ0iYJFu\nTE4nE00QCWOxmWfsLYa1fXnjS3KrjvwlNXF6oEE/hWWhGN8aevSEMLXU5oJwcB1i\nQFBVAD/c/Zhr4vuichlvzsA9K5U9Ryaed4UlA4kQWLqjaZdCoE9fq+mNKQKBgQCb\nZhFKCqg3fcpeYWgpppCcyUMSzK83K269b1nJufU6r18M6T2/Z8cHNuYeqokR24Zl\nesApbyilY9VXj9gpKXr077Gp7/9tuE7vn+mgq2azfkKQX+UeSGA0hTv9NGW24nTg\n+MylmjxoqOI5c1I1c5Vjz2E14lGRLHDa6HqcKJm+wQKBgD34MiF+m8iN0FpnWsuh\nFu0sLYOykBxnESaRyJfv3ZFvVypG8oR6hdpgBeAPYlxv7lpOofJWXUgONi5sReLk\nkJAT78DONxYwebgOunZTEq6iqrO4fqOk8IcPMbgde3cL/+z5yD0FiAiHNlBqdkUh\n4DpzWoY1hAtNULSLix8tQkuY\n-----END PRIVATE KEY-----\n",
  //     "client_email": "firebase-adminsdk-jlweo@elearner-131f1.iam.gserviceaccount.com",
  //     "client_id": "104783663553589019699",
  //     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  //     "token_uri": "https://oauth2.googleapis.com/token",
  //     "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  //     "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-jlweo%40elearner-131f1.iam.gserviceaccount.com",
  //     "universe_domain": "googleapis.com"
  //   };
  //     //Your serviceAccoucnt Json Data
  //
  //
  //   List<String> scopes = [
  //     "https://www.googleapis.com/auth/userinfo.email",
  //     "https://www.googleapis.com/auth/firebase.database",
  //     "https://www.googleapis.com/auth/firebase.messaging"
  //   ];
  //
  //   http.Client client = await auth.clientViaServiceAccount(
  //     auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
  //     scopes,
  //   );
  //
  //
  //   // Obtain the access token
  //   auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
  //       auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
  //       scopes,
  //       client
  //   );
  //
  //   // Close the HTTP client
  //   client.close();
  //
  //   // Return the access token
  //   return credentials.accessToken.data;
  //
  // }
  // Future<void> sendFCMMessage() async {
  //   final String serverKey = await getAccessToken() ; // Your FCM server key
  //   final String fcmEndpoint = 'https://fcm.googleapis.com/v1/projects/elearner-131f1/messages:send';
  //   final  currentFCMToken = await FirebaseMessaging.instance.getToken();
  //   print("fcmkey : $currentFCMToken");
  //   final Map<String, dynamic> message = {
  //     'message': {
  //       'token': currentFCMToken, // Token of the device you want to send the message to
  //       'notification': {
  //         'body': 'This is an FCM notification message!',
  //         'title': 'FCM Message'
  //       },
  //       'data': {
  //         'current_user_fcm_token': currentFCMToken, // Include the current user's FCM token in data payload
  //       },
  //     }
  //   };
  //
  //   final http.Response response = await http.post(
  //     Uri.parse(fcmEndpoint),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $serverKey',
  //     },
  //     body: jsonEncode(message),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print('FCM message sent successfully');
  //   } else {
  //     print('Failed to send FCM message: ${response.statusCode}');
  //   }
  // }


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



  getDashboardData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: "46",
      };
      try {
         dashboardData = await ApiMethods.dashBoardApi(bodyParams: bodyParams);
          if (dashboardData != null && dashboardData?.status != '0') {
            isLoading = false;
            final item = dashboardData?.result?.restaurant;

            // data = {
            //   ApiKeyConstants.categoryName: ,
            // };

             print("resulteee : ${item!}");
            // print("data is of result : ${item.categoryName!}");
            increment();
            // Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            print("new message problem ${dashboardData!.message ?? ''}");
            Get.snackbar("Error", dashboardData!.message ?? '');
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading = false;
          //Get.snackbar(" ", "data ${dashboardData?.result}");

      } catch (e) {
        // showLoading = false;
        isLoading = false;
        print("new catch  ${e.toString()}");

        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please dashboard", e.toString());
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  void increment() => count.value++;

  void likeIncrement() => like.value++;

  void clickOnLike(String id, bool like, int index) async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
        ApiKeyConstants.eventId: id,
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          simpleResponseModel =
              await ApiMethods.likeUnlikeEvent(bodyParams: bodyParams);
          if (simpleResponseModel != null &&
              simpleResponseModel?.status != '0') {
            isLoading = false;

            increment();
          } else {
            Get.snackbar("Error", simpleResponseModel!.message ?? '');
          }

          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        // Get.snackbar("please", 'Enter unique email and phone number...');
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  Future<void> clickOnItemFeature(int index, String id , String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> bodyParams = {
      ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      ApiKeyConstants.eventId: dashboardData?.result?.featured?[index].id ?? "",
    };
    Get.toNamed(Routes.EVENT_DETAILS_PAGE,parameters: bodyParams);
  }

  Future<void> clickOnItemRestaurant(int index, String id , String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> bodyParams = {
      ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      ApiKeyConstants.eventId: dashboardData?.result?.categories?[index].id ?? "",
    };
    Get.toNamed(Routes.EVENT_DETAILS_PAGE,parameters: bodyParams);
  }
}
