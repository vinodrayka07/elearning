import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.count.value;

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
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.offNamed(Routes.SIGNUP);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.topLeft,
                                //cupertinoicons
                               // color: Colors.white,
                                child: Icon(CupertinoIcons.back,color: ApkColors.greenColor,)
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: const Text(
                                "What's your phone number?",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF15C55D),
                                    fontSize: 24,
                                    letterSpacing: 0.5),
                              ),

                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              child: const Text(
                                "Let's get started by creating your account",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.bold,
                                    color:ApkColors.opacity90greenColor,
                                    fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),

                      Obx(() {
                        controller.MobileNamecount.value;
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: CommonWidget.commonTextfield(
                              validator: controller.Mobillidator,
                              labelText: "Mobile Number",
                              maxLength: 10,
                              autofocus: false,
                              prefixIcon: const Icon(Icons.phone_android_rounded,
                              color: ApkColors.orangeColor,),
                              keyboardType: TextInputType.phone,
                              controller: controller.MobileNumber),
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
                              controller.sendshowSuccessToastMessage(
                                  "Loading", context);
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

                      const SizedBox(height: 40),

                       Container(
                         alignment: Alignment.center,
                         child: const Text(
                          "Prefer to sign in with email?",
                          style: TextStyle(
                              fontFamily: 'Nunito-Bold',
                              fontWeight: FontWeight.bold,
                              color:ApkColors.greenColor,
                              fontSize: 16,
                          letterSpacing: 0.8),
                                               ),
                       )

                      // BottomOptions(),
                    ],
                  ),
                ),
              )),


        ],
      )
    );
  }
}
