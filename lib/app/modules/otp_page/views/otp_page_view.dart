import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_input_editor/otp_input_editor.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/otp_page_controller.dart';

class OtpPageView extends GetView<OtpPageController> {
  const OtpPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ApkColors.backgroundColor,
        body:Column(
          children: [

            SizedBox(
              height: 40,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                    color: ApkColors.backgroundColor
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
                                height: 80,
                              ),
                              Container(

                                width: double.infinity,
                                child: const Text(
                                  "Enter the verification code",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF15C55D),
                                      fontSize: 18,
                                      letterSpacing: 0.5),
                                ),

                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child:  const Row(
                                  children: [
                                    Text(
                                      "We sent you a 4-digit code to",
                                      style: TextStyle(
                                          fontFamily: 'Nunito-Bold',
                                          fontWeight: FontWeight.bold,
                                          color:ApkColors.opacity90greenColor,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      " +91 6264***",
                                      style: TextStyle(
                                          fontFamily: 'Nunito-Bold',
                                          fontWeight: FontWeight.bold,
                                          color:ApkColors.opacity90greenColor,
                                          fontSize: 12),
                                    ),

                                  ],

                                )

                                // const Text(
                                //   "We sent you a 4-digit code to +91 6264******",
                                //   style: TextStyle(
                                //       fontFamily: 'Nunito-Bold',
                                //       fontWeight: FontWeight.bold,
                                //       color:ApkColors.opacity90greenColor,
                                //       fontSize: 14),
                                // ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),

                        Obx(() {
                          controller.MobileNamecount.value;
                          return
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 50, right: 50),
                                    child: getOtpEditor),
                                spacer,
                                clearOtpButton,
                                Obx((){
                                  controller.MobileNamecount.value;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {

                                            controller.showOtp = ! controller.showOtp;
                                            controller.mobileLoad();

                                          },
                                          child: Row(

                                            children: controller.showOtp
                                                ? [
                                              const Icon(Icons.visibility_off),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Text("Hide"),
                                              )
                                            ]
                                                : [
                                              const Icon(Icons.visibility),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Text("Show"),
                                              )
                                            ],
                                          )),
                                    ],
                                  );
                                })
                              ],
                            );
                        }),
                        const SizedBox(
                          height: 40,
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
                                        ? const Text("Verify Otp",
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

                        const SizedBox(height: 40),

                        Container(
                          child: const Row(
                            //please check error is responsible for const
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive the code?",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.bold,
                                    color:ApkColors.opacity90greenColor,
                                    fontSize: 14),
                              ),
                              Text(
                                " (00:15)",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.bold,
                                    color:ApkColors.opacity90greenColor,
                                    fontSize: 14),
                              ),

                            ],

                          )
                        )

                        // BottomOptions(),
                      ],
                    ),
                  ),
                )),],







        )
    );
  }


  SizedBox get spacer {
    return const SizedBox(
      height: 5,
    );
  }



  Row get clearOtpButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
          child: InkWell(
            key: const Key("clear-key"),
            onTap: () {
              if (controller.otpInputController != null) {
                controller.otpInputController!.clear();
                controller.otpData = controller.otpInputController?.otp ?? "";
                controller.mobileLoad();
              }
            },
            child: const Text(
              "Clear OTP",
              style: TextStyle(
                color: ApkColors.greenColor,
                fontSize: 17,
                //decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  OtpInputEditor get getOtpEditor {
    return OtpInputEditor(
      key: const Key("otp-field"),
      obscureText: controller.showOtp,
      otpLength: 4,
        textInputStyle: const TextStyle(
          color: ApkColors.greenColor,
          fontSize: 16,
          fontFamily: 'NUnit-Bold',
          fontWeight: FontWeight.bold,

        ),
      onOtpChanged: (value) {
        print(value);

          controller.otpData = value;
        controller.mobileLoad();

      },
      onInitialization: (OtpInputController otpInputController) {

          controller.otpInputController = otpInputController;
          controller.mobileLoad();

      },
      invalid: false,
      otpTextFieldBackgroundColor: ApkColors.primaryColor,
      cursorHeight: 25,
      boxShadow: const [
        BoxShadow(
          color: ApkColors.orangeColor,
          blurRadius: 5.0,
          spreadRadius: 10,
        ),
      ],
      fieldWidth: 50,
      fieldHeight: 50,
      cursorWidth: 1.5,
      boxDecoration: BoxDecoration(
        border: Border.all(
          color: ApkColors.greenColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text(
        "OTP Input Editor Example",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  List<Widget> get getOtpText {
    return [
      const Text(
        "Entered Otp:",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        key: const Key("otp-value"),
        controller.otpData,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ];
  }
}

