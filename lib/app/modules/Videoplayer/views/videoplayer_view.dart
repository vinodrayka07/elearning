import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flexivideoplayer/flexivideoplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/videoplayer_controller.dart';

class VideoplayerView extends GetView<VideoplayerController> {
  const VideoplayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("videoPlayerController1 : ${controller.isSourceError}");
    print("videoPlayerController1 : ${controller.onvvInit}");

    return Scaffold(
      backgroundColor: ApkColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ApkColors.backgroundColor,
        title: const Text(
          "Course",
          style: TextStyle(
            color: ApkColors.greenColor,
            fontSize: 20,
            fontFamily: 'Nunito-Bold',
          ),
        ),
        iconTheme: const IconThemeData(color: ApkColors.greenColor),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(() {
              controller.count.value;
              return Container(
                color: Colors.black,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: controller.isSourceError
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const Icon(
                                CupertinoIcons.exclamationmark_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(height: 10),
                              const Text(
                                'This video is unavailable',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.initializePlayer();
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Reload again",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                ),
                              )
                            ])
                      : controller.flexiController != null
                          ?
                          // &&
                          // controller.flexiController!
                          //            .videoPlayerController.value.isInitialized
                          //        ?
                          Stack(
                              children: [
                                Flexi(
                                  controller: controller.flexiController!,
                                ),
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Text(
                                    "Reload again",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                ),
                              ],
                            )
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Loading',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ]),
                ),
              );
            })
          ],
        ),
      )),
    );
  }
}
