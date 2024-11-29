import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flexivideoplayer/flexivideoplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class VideoplayerController extends GetxController {
  //TODO: Implement VideoplayerController

  late VideoPlayerController videoPlayerController1;
   FlexiController? flexiController;
  bool isSourceError = false;

  bool onvvInit = false;



  String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  final count = 0.obs;
  @override
  void onInit() {
    initializePlayer();
    increment();
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
  void dispose(){
    videoPlayerController1.dispose();
    flexiController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {

      increment();

      isSourceError = false;

    try {

      videoPlayerController1 =
          VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      // videoPlayerController1 =
      //     VideoPlayerController.network('https://examster.000webhostapp.com/Saware____%F0%9F%AB%A0%E2%9D%A4%EF%B8%8F_%F0%9F%A9%B9____No%20Copyright%20video%20___Black%20Screen%20Video___%20WhatsApp%20Status%20%F0%9F%96%A4%E2%9C%A8(1).mp4');



      videoPlayerController1.addListener(() {
        increment();
      });
      videoPlayerController1.setLooping(true);
      videoPlayerController1.initialize();


      onvvInit = true;




      final subtitles = [

        Subtitle(
          index: 0,
          start: const Duration(seconds: 0),
         // end: Duration(seconds: videoPlayerController1.value.duration.inSeconds),
          end: const Duration(seconds: 10),
          text: 'Whats up? :)',

        ),
      ];

      increment();

      flexiController = FlexiController(

        aspectRatio: 16 / 9,
        deviceOrientationsOnEnterFullScreen: [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ],
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        allowFullScreen: false,
        fullScreenByDefault: false,
        allowedScreenSleep: false,
        zoomAndPan:true,
        showControls: true,
        videoPlayerController: videoPlayerController1,
        autoPlay: false,
        looping: true,
        errorBuilder: (context, errorMessage) {
          print("Error find : $errorMessage");

          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
              onTap: toggleVideo,
              iconData: Icons.live_tv_sharp,
              title: 'Toggle Video Src',
            ),
            OptionItem(
              onTap: toggleVideo,
              iconData: Icons.live_tv_sharp,
              title: 'Toggle Video Src',
            ),
          ];
        },

        optionsTranslation: OptionsTranslation(
          playbackSpeedButtonText: 'Wiedergabegeschwindigkeit',
          subtitlesButtonText: 'Untertitel',
          cancelButtonText: 'Abbrechen',
        ),


        placeholder : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.cyanAccent,
                height: 150,
                alignment: Alignment.topCenter,
                child: Lottie.asset(
                  'assets/animationfile/loading.json',
                  repeat: true,
                  reverse: false,
                  animate: true,
                  // delegates: LottieDelegates(
                  //   values: [
                  //     ValueDelegate.color(
                  //       // keyPath order: ['layer name', 'group name', 'shape name']
                  //       const ['**', 'ball2', '**'],
                  //       value: ApkColors.orangeColor,
                  //     ),
                  //     ValueDelegate.color(
                  //       // keyPath order: ['layer name', 'group name', 'shape name']
                  //       const ['**', 'ball 1', '**'],
                  //       value: ApkColors.orangeColor,
                  //     ),
                  //     ValueDelegate.color(
                  //       // keyPath order: ['layer name', 'group name', 'shape name']
                  //       const ['**', 'ball 4', '**'],
                  //       value: ApkColors.orangeColor,
                  //     ),
                  //   ],
                  // ),
                ),
              )

            ],

          ),
       subtitle: Subtitles(subtitles),
        subtitleBuilder: (context, dynamic subtitle) =>
            Container(
              color: ApkColors.darkgreenColor,
              padding: const EdgeInsets.all(10.0),
              child: subtitle is InlineSpan
                  ? RichText(
                text: subtitle,
              )
                  : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),

        hideControlsTimer: const Duration(seconds: 2),

        // Try playing around with some of these other options:
        isBrignessOptionDisplay: true,
        isVolumnOptionDisplay: true,



        cupertinoProgressColors: FlexiProgressColors(
          playedColor: ApkColors.greenColor,
          handleColor: ApkColors.greenColor,
          backgroundColor: ApkColors.primaryColor,
          bufferedColor: ApkColors.darkgreenColor,
        ),

      );
      increment();

    //  setState(() {});

    }
    catch(exception){

      // setState(() {

      isSourceError = true;
      increment();
      // });
      print("exception : $exception");
    }
  }

  Future<void> toggleVideo() async {

    await initializePlayer();
    increment();
  }

  void increment() => count.value++;
}
