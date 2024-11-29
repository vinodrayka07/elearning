import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:elearner/app/colors/ApkColors.dart';
import 'package:elearner/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  //var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool? c = false;
    print("check value ${controller.checkboxvalue}");
    //controller.loginButtonAnimationController=

    //controller.count.value;
    return Scaffold(
        backgroundColor: const Color(0XFF16171B),
        body: Column(
          children: [
            SizedBox(
              height: 40,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0XFF16171B),
                  // color: Colors.cyan,
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            // color: Colors.white,
                            child: Image.asset(
                              'assets/images/elearnerlogo.png',
                              height: Get.height * 0.02,
                              width: Get.width * 0.02,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF15C55D),
                                  fontSize: 22,
                                  letterSpacing: 0.8),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text(
                              "Let's get started by creating your account",
                              style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF15C55D),
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Obx(() {
                      controller.FirstNamecount.value;
                      return Container(
                        //color: Colors.cyan,

                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CommonWidget.commonTextfield(
                            validator: controller.FirstNamevalidator,
                            labelText: "First Name",
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            controller: controller.FirstName),
                      );
                    }),

                    const SizedBox(
                      height: 20,
                    ),

                    Obx(() {
                      controller.LastNamecount.value;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CommonWidget.commonTextfield(
                            validator: controller.LastNamevalidator,
                            labelText: "Last Name",
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            controller: controller.LasttName),
                      );
                    }),

                    const SizedBox(
                      height: 20,
                    ),

                    Obx(() {
                      controller.EmailNamecount.value;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CommonWidget.commonTextfield(
                            validator: controller.Emailvalidator,
                            labelText: "Email Address",
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.EmailAddress),
                      );
                    }),

                    const SizedBox(
                      height: 20,
                    ),

                    Obx(() {
                      controller.MobileNamecount.value;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CommonWidget.commonTextfield(
                            validator: controller.Mobillidator,
                            labelText: "Mobile Number",
                            autofocus: false,
                            keyboardType: TextInputType.phone,
                            controller: controller.MobileNumber),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),

                    Obx(() {
                      controller.PasswordNamecount.value;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CommonWidget.commonTextfield(
                            wntsuffixIcon: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0XFFDC4036),
                              ),
                              onPressed: () {
                                controller.passwordLoad();
                                // Update the state i.e. toogle the state of passwordVisible variable
                                controller.passwordVisible =
                                    !controller.passwordVisible;
                              },
                            ),
                            obscureText: controller.passwordVisible,
                            validator: controller.Passwordvalidator,
                            labelText: "Password",
                            autofocus: false,
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.Password),
                      );
                    }),

                    const SizedBox(
                      height: 20,
                    ),

                    Obx(() {
                      controller.ConformPasswordNamecount.value;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CommonWidget.commonTextfield(
                            wntsuffixIcon: true,
                            textInputAction: TextInputAction.done,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.ConFormPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0XFFDC4036),
                              ),
                              onPressed: () {
                                controller.conformLoad();
                                // Update the state i.e. toogle the state of passwordVisible variable
                                controller.ConFormPasswordVisible =
                                    !controller.ConFormPasswordVisible;
                              },
                            ),
                            obscureText: controller.ConFormPasswordVisible,
                            validator: (String? value) {
                              var passNonNullValue = value ?? "";
                              if (passNonNullValue.isEmpty) {
                                return ("Conform Password is required");
                              }
                              if (controller.Password.text != value) {
                                return "Enter Right Conform Password";
                              } else
                                return null;
                            },
                            labelText: "Conform Password",
                            autofocus: false,
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.ConfirmPassword),
                      );
                    }),

                    const SizedBox(
                      height: 10,
                    ),

                    Obx(() {
                      controller.checkbox.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 60,
                            // color: Colors.black,
                            child: Checkbox(
                              side: const BorderSide(
                                color: ApkColors.greenColor,
                                style: BorderStyle.solid,
                              ),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              value: controller.checkboxvalue,
                              checkColor: ApkColors.backgroundColor,
                              activeColor: ApkColors.greenColor,
                              onChanged: (bool? value) {
                                controller.checkboxvalue = value!;
                                controller.checkboxLoad();
                              ;
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 30,

                                  // color: Colors.blue,
                                  child: Row(
                                    children: [
                                      const Text(
                                        "I agree to the medidoc ",
                                        style: TextStyle(
                                            fontFamily: 'Nunito-Bold',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF15C55D),
                                            fontSize: 12),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          " Terms of Service",
                                          style: TextStyle(
                                              fontFamily: 'Nunito-Bold',
                                              fontWeight: FontWeight.bold,
                                              color: ApkColors.orangeColor,
                                              fontSize: 12,
                                              letterSpacing: 0.8),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                height: 20,
                                // color: Colors.black,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                        fontFamily: 'Nunito-Bold',
                                        fontWeight: FontWeight.bold,
                                        color: ApkColors.orangeColor,
                                        fontSize: 12,
                                        letterSpacing: 0.8),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }),

                    const SizedBox(
                      height: 10,
                    ),

                    Obx(() {
                      controller.animatedButten.value;
                      // return CommonWidget.commonbutten(
                      //     onPressed: () {
                      //       controller.formKey.currentState!.validate();
                      //       },
                      //     wantGradient: true,
                      //     borderredius: 15);
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.playLoginAnimation();
                            // controller.sendshowSuccessToastMessage(
                            //     "Loading", context);
                            controller.formKey.currentState!.validate();
                            controller.animatedBtnLoad();
                           // controller.increment();
                          },
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 1000),
                            opacity: controller.completed ? 0.0 : 1.0,
                            child: Container(
                                width:
                                    controller.loginButtonSizeAnimation.value,
                                height: Get.height * 0.06,
                                alignment: FractionalOffset.center,
                                decoration: const BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          ApkColors.opacity80greenColor,
                                          ApkColors.greenColor,
                                          ApkColors.opacity80greenColor
                                        ]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: !controller.isLoading
                                    ? const Text("Sign Up",
                                        style: TextStyle(
                                            fontFamily: 'Nunito-Bold',
                                            fontWeight: FontWeight.bold,
                                            color: ApkColors.backgroundColor,
                                            fontSize: 17,
                                            letterSpacing: 0.8))
                                    : const RefreshProgressIndicator(
                                        backgroundColor:
                                            ApkColors.backgroundColor,
                                      )),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 10),

                    BottomOptions()
                    // BottomOptions(),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}

Padding BottomOptions() {
  return Padding(
    padding: EdgeInsets.only(left: 50, right: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "or",
          style: TextStyle(
              fontFamily: 'Nunito-Bold',
              fontWeight: FontWeight.bold,
              color: Color(0XFF15C55D),
              fontSize: 12),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFF16171B),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0XFF15C55D), width: 1),
                ),
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/googleicon.png',
                    height: 30,
                    width: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFF16171B),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0XFF15C55D), width: 1),
                ),
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/appleicon.png',
                    height: 30,
                    width: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an Account? ",
              style: TextStyle(
                  fontFamily: 'Nunito-Bold',
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF15C55D),
                  fontSize: 16),
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed(Routes.LOGIN_PAGE);
              },
              child: const Text(
                "Login",
                style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFDC4036),
                    fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}
