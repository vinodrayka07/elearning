import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ApkColors.backgroundColor,
        body:Obx((){
          controller.count.value;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                     //color: Colors.cyanAccent,
                    height: Get.height*0.3,
                    alignment: Alignment.topCenter,
                    child: Lottie.asset(
                      'assets/animationfile/loading.json',
                      repeat: true,
                      reverse: false,
                      animate: true,
                      delegates: LottieDelegates(
                        values: [
                          ValueDelegate.color(
                            // keyPath order: ['layer name', 'group name', 'shape name']
                            const ['**', 'Learn', '**'],
                            value: ApkColors.greenColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      Text("© 2024 -AMUSE App | Powered By AMUSE",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            color: ApkColors.greenColor,
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                          ))),
                  SizedBox(
                    height: Get.height*0.08,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height*0.12,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: ApkColors.greenColor,
                      radius: 33.px,
                      child: CircleAvatar(
                        backgroundColor: ApkColors.primaryColor,
                        radius: 30.px,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: CommonWidget.imageView(image:"https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png",
                                height: 80.px,
                                width: 80.px,
                                defaultNetworkImage:"https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png")
                          // Image.network(
                          //   controller.userModel?.result?.image == ''
                          //       ? 'https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png'
                          //       :  controller.userModel?.result?.image ?? 'https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png',
                          //   fit: BoxFit.cover,
                          //   height: 80.px,
                          //   width: 80.px,
                          // ),
                        ),
                        //CircleAvatar
                      ), //CircleAvatar
                    ),
                  ),
                  SizedBox(
                    height: Get.height*0.04,
                  ),

                  const Text(
                    "AMUSE",
                    style: TextStyle(
                      fontSize: 25,
                      color: ApkColors.greenColor,
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Let's some enjoy",
                    style: TextStyle(
                      fontSize: 16,
                      color: ApkColors.greenColor,
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // LottieBuilder(lottie: Lottie(composition: composition), ),
                ],
              ),
            ],
          );
        })
          //controller.count.value;

        );
  }
}
