import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/get_send_otp_model.dart';
import '../../../routes/app_pages.dart';


class LoginPageController extends GetxController with GetSingleTickerProviderStateMixin  {
  //TODO: Implement LoginPageController

  final count = 0.obs;
  final MobileNamecount = 0.obs;
  final animatedButten = 0.obs;

  bool isLoading = false;
  bool completed = false;
  String dialcode = "+91";


  late AnimationController loginButtonAnimationController;
  late Animation<double> loginButtonSizeAnimation;


  void mobileLoad() => MobileNamecount.value++;
  void animatedBtnLoad()=> animatedButten.value++;

  TextEditingController MobileNumber = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    loginButtonAnimationController= AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this
    );

    loginButtonSizeAnimation = Tween<double>(begin: 260, end: 60)
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

  loginWithOtpApiCalling() async {
    if (MobileNumber.text.trim().isNotEmpty) {
      //showLoading = true;
      isLoading = false;
      Map<String, String> bodyParams = {
        ApiKeyConstants.mobile: MobileNumber.text,
        ApiKeyConstants.countryCode: dialcode,
      };
      try {
        SendOtpModel? sendOtpModel =
        await ApiMethods.sendOtpForLogin(bodyParams: bodyParams);
        if (sendOtpModel != null && sendOtpModel.status != '0') {
          Map<String, String> data = {
            ApiKeyConstants.mobile: MobileNumber.text,
            ApiKeyConstants.countryCode: dialcode,
          };
          Get.toNamed(Routes.OTP_PAGE, parameters: data);
        } else {
          Get.snackbar("Error", sendOtpModel!.message ?? '');
          //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
          // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
        }
        // showLoading = false;
        isLoading = true;
      } catch (e) {
        // showLoading = false;
        isLoading = true;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please", 'Enter unique phone number...');
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", "please fill mobile number");
    }
  }


  void playLoginAnimation() async {
    if (isLoading)
      return;


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
        loginWithOtpApiCalling();
        // isloading false then sigup butten again show
        isLoading = false;
        Timer(Duration(milliseconds: 800), () {
          completed = false;
          animatedBtnLoad();
        });
      });
    }
    on TickerCanceled {}
  }

  void increment() => count.value++;

  void sendshowSuccessToastMessage(String s,BuildContext c) {

    CommonWidget.showSuccessToastMessage(s,c);

  }

  FormFieldValidator<String>?  Mobillidator = (String? value) {
    if (value!.length < 10) {
      return "Enter at least 10 number";
    } else
      return null;
  };
}

