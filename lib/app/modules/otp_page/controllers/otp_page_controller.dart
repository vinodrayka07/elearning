import 'dart:async';
import 'package:elearner/LIstviews/CommonListViews.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:otp_input_editor/otp_input_editor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/get_send_otp_model.dart';
import '../../../data/apis/Api_Models/get_user_model.dart';
import '../../../routes/app_pages.dart';

class OtpPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement OtpPageController
  Map<String, String?> data = Get.parameters;

  final count = 0.obs;
  final MobileNamecount = 0.obs;
  final animatedButten = 0.obs;

  bool isLoading = false;
  bool completed = false;
  String dialcode = "+91";

  late AnimationController loginButtonAnimationController;
  late Animation<double> loginButtonSizeAnimation;

  void mobileLoad() => MobileNamecount.value++;

  void animatedBtnLoad() => animatedButten.value++;

  String otpData = "";

  OtpInputController? otpInputController;
  bool showOtp = true;
  var formKey = GlobalKey<FormState>();

  //final count = 0.obs;
  @override
  void onInit() {
    loginButtonAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    loginButtonSizeAnimation = Tween<double>(begin: 240, end: 50)
        .animate(loginButtonAnimationController)
      ..addListener(() {
        animatedBtnLoad();
      });
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

  @override
  void dispose() {
    loginButtonAnimationController.dispose();
    super.dispose();
  }

  otpApiCalling() async {
    if (otpData.isNotEmpty) {
      //showLoading = true;
      isLoading = false;
      Map<String, String> bodyParams = {
        ApiKeyConstants.mobile: data[ApiKeyConstants.mobile] ?? "",
        ApiKeyConstants.countryCode: data[ApiKeyConstants.countryCode] ?? "",
        ApiKeyConstants.otp: otpData ?? "",
        ApiKeyConstants.token: "token123345",
      };
      try {
        UserModel? userModel =
            await ApiMethods.loginWithOtp(bodyParams: bodyParams);
        if (userModel != null && userModel.status != '0') {
          Map<String, String> bodyParams = {
            ApiKeyConstants.mobile: userModel.result?.mobile ?? "",
            ApiKeyConstants.name: userModel.result?.userName ?? "",
            ApiKeyConstants.email: userModel.result?.email ?? "",
            ApiKeyConstants.gender: userModel.result?.gender ?? "",
            ApiKeyConstants.dob: userModel.result?.dob ?? "",
            ApiKeyConstants.password: userModel.result?.password ?? "",
            ApiKeyConstants.token: "token123345",
          };

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool("isLogin", true);
          prefs.setString("name", userModel.result?.userName ?? "");
          prefs.setString("email", userModel.result?.email ?? "");
          prefs.setString("password", userModel.result?.password ?? "");
          prefs.setString("token","token123345");
          prefs.setString("userid",userModel.result?.id ?? "");
          Get.toNamed(Routes.HOME, parameters: bodyParams);

        } else {
          Get.snackbar("Error", userModel!.message ?? '');
          //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
          // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
        }
        // showLoading = false;
        isLoading = true;
      } catch (e) {
        // showLoading = false;
        isLoading = true;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please", 'Enter unique email and phone number...');
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", "please fill otp");
    }
  }

  void playLoginAnimation() async {
    if (isLoading) return;

    isLoading = true;
    animatedBtnLoad();

    try {
      await loginButtonAnimationController.forward();

      Timer(Duration(milliseconds: 1200), () {
        // CommonWidget.showSuccessToastMessage("success",Get.context!);
        print("success");

        loginButtonAnimationController.reverse();
        completed = true;
        animatedBtnLoad();

        // replace those lines with your logic
        // e.g. navigation to a new page
        //Get.offNamed(Routes.HOME);
        //print(otpData);
        // Map<String, String> bodyParams = {
        //   ApiKeyConstants.mobile: data[ApiKeyConstants.mobile] ?? "",
        //   ApiKeyConstants.countryCode: data[ApiKeyConstants.countryCode] ?? "",
        //   ApiKeyConstants.otp: otpData ?? "",
        //   ApiKeyConstants.token: "token123345",
        // };
        // print(bodyParams);
        otpApiCalling();
        // Get.toNamed(Routes.OTP_PAGE,parameters: data);
        // isloading false then sigup butten again show
        //isLoading = false;
        Timer(Duration(milliseconds: 800), () {
          completed = false;
          animatedBtnLoad();
        });
      });
    } on TickerCanceled {}
  }

  void increment() => count.value++;

  void sendshowSuccessToastMessage(String s, BuildContext c) {
    CommonWidget.showSuccessToastMessage(s, c);
  }
}
