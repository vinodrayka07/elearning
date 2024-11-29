import 'dart:async';

import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:elearner/app/data/apis/StringConstants/StringConstants.dart';
import 'package:elearner/app/modules/Signup/views/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/SimpleResponseModel.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement SignupController

  TextEditingController FirstName = TextEditingController();
  TextEditingController LasttName = TextEditingController();
  TextEditingController EmailAddress = TextEditingController();
  TextEditingController MobileNumber = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  late AnimationController loginButtonAnimationController;
  late Animation<double> loginButtonSizeAnimation;


  bool isLoading = false;
  bool completed = false;

  bool passwordVisible = false;
  bool ConFormPasswordVisible = false;
  bool checkboxvalue = false;
  String dialcode = "+91";

  var formKey = GlobalKey<FormState>();
  final count = 0.obs;
  final FirstNamecount = 0.obs;
  final LastNamecount = 0.obs;
  final EmailNamecount = 0.obs;
  final MobileNamecount = 0.obs;
  final PasswordNamecount = 0.obs;
  final ConformPasswordNamecount = 0.obs;
  final checkbox = 0.obs;
  final animatedButten = 0.obs;

  @override
  void onInit() {
    loginButtonAnimationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    loginButtonSizeAnimation = Tween<double>(begin: 260, end: 50)
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

  void increment() => count.value++;

  void animatedBtnLoad() => animatedButten.value++;

  void firstNameLoad() => FirstNamecount.value++;

  void lastNameLoad() => LastNamecount.value++;

  void emailLoad() => EmailNamecount.value++;

  void mobileLoad() => MobileNamecount.value++;

  void passwordLoad() => PasswordNamecount.value++;

  void conformLoad() => ConformPasswordNamecount.value++;

  void checkboxLoad() => checkbox.value++;

  FormFieldValidator<String>? FirstNamevalidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("First Name is required");
    } else
      return null;
  };
  FormFieldValidator<String>? LastNamevalidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("Last Name is required");
    } else
      return null;
  };
  FormFieldValidator<String>? Emailvalidator = (String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Email is required");
    }
    // else if(!regex.hasMatch(passNonNullValue)){
    //   return ("Email is not valid please check your email ");
    // }
    return null;
  };
  FormFieldValidator<String>? Mobillidator = (String? value) {
    if (value!.length < 10) {
      return "Enter at least 10 number";
    } else
      return null;
  };
  FormFieldValidator<String>? Passwordvalidator = (String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Password is required");
    } else if (passNonNullValue.length < 6) {
      return ("Password Must be more than 6 characters");
    }
    // else if(!regex.hasMatch(passNonNullValue)){
    //   return ("Password should contain upper,lower,digit and Special character ");
    // }
  };

  Test() {
    Map<String, String> data = {
      ApiKeyConstants.mobile: MobileNumber.text,
      ApiKeyConstants.countryCode: dialcode,
    };

    Get.toNamed(Routes.OTP_PAGE, parameters: data);
  }


  // I/flutter (10083): URL:: https://server-php-8-2.technorizen.com/amuse/api/Register
  // I/flutter (10083): TOKEN:: {Authorization: Bearer , Accept: application/json}
  // I/flutter (10083): bodyParams:: {first_name: vinod, last_name: rayka, email: vinodrayka07@gmail.com, password: 123456, mobile: 6264664243, country_code: +91}

  signUpApiCalling() async {
    if (FirstName.text.trim().isNotEmpty &&
        EmailAddress.text.trim().isNotEmpty &&
        MobileNumber.text.trim().isNotEmpty &&
        Password.text.trim().isNotEmpty &&
        LasttName.text.isNotEmpty) {
      //showLoading = true;
      isLoading = false;
      Map<String, String> bodyParams = {
        ApiKeyConstants.firstName: FirstName.text,
        ApiKeyConstants.lastName: LasttName.text,
        ApiKeyConstants.email: EmailAddress.text,
        ApiKeyConstants.password: Password.text,
        ApiKeyConstants.mobile: MobileNumber.text,
        ApiKeyConstants.countryCode: dialcode,
      };
      try {
        if (checkboxvalue == false) {
          isLoading = false;
          Get.snackbar(" ", "please check privacy and policy");
        } else {
          SimpleResponseModel? simpleResponseModel =
              await ApiMethods.userSignup(bodyParams: bodyParams);
          if (simpleResponseModel != null &&
              simpleResponseModel.status != '0') {
            Map<String, String> data = {
              ApiKeyConstants.mobile: MobileNumber.text,
              ApiKeyConstants.countryCode: dialcode,
            };

            Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            Get.snackbar("Error", simpleResponseModel!.message ?? '');
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading = true;
        }
      } catch (e) {
        // showLoading = false;
        isLoading = true;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please", 'Enter unique email and phone number...');
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
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
        //Test();
        signUpApiCalling();
        //print("check value ${checkboxvalue}");
        //Get.snackbar("Error", "fdhfd");
        // isloading false then sigup butten again show
        isLoading = false;
        Timer(Duration(milliseconds: 800), () {
          completed = false;
          animatedBtnLoad();
        });
      });
    } on TickerCanceled {}
  }

  void sendshowSuccessToastMessage(String s, BuildContext c) {
    CommonWidget.showSuccessToastMessage(s, c);
  }

// FormFieldValidator<String>?  ConfermPasswordvalidator = (String? value) {
//   var passNonNullValue = value ?? "";
//
//   if (passNonNullValue.isEmpty) {
//     return ("Password is required");
//   }
//
//   if (Password.text.trim() != value) {
//     return "Enter Right Password";
//   } else
//     return null;
//   // else if(!regex.hasMatch(passNonNullValue)){
//   //   return ("Password should contain upper,lower,digit and Special character ");
//   // }
// };
}
