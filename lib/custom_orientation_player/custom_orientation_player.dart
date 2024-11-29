
import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/mock_data.dart';
import 'controls.dart';
import 'data_manager.dart';
import 'flick_video_speed_control_slider_widget.dart';

class CustomOrientationPlayer extends StatefulWidget {
  CustomOrientationPlayer({Key? key}) : super(key: key);


  @override
  _CustomOrientationPlayerState createState() =>
      _CustomOrientationPlayerState();
}

class _CustomOrientationPlayerState extends State<CustomOrientationPlayer> {
  late FlickManager flickManager;
  late DataManager dataManager;
  List<String> urls = (mockData["items"] as List)
      .map<String>((item) => item["trailer_url"])
      .toList();

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(urls[0]),
        ),
        onVideoEnd: () {
          dataManager.skipToNextVideo(Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, urls: urls);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String url) {
    flickManager
        .handleChangeVideo(VideoPlayerController.networkUrl(Uri.parse(url)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ApkColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ApkColors.backgroundColor,
        automaticallyImplyLeading: true,
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
        body: VisibilityDetector(
          key: ObjectKey(flickManager),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 0 && this.mounted) {
              flickManager.flickControlManager?.autoPause();
            } else if (visibility.visibleFraction == 1) {
              flickManager.flickControlManager?.autoResume();
            }
          },
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 60,
              ),

              Container(
                height: 200,

                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  preferredDeviceOrientationFullscreen: [
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ],
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: CustomOrientationControls(dataManager: dataManager,flickManager: flickManager),
                  ),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    videoFit: BoxFit.fitWidth,
                    controls: CustomOrientationControls(dataManager: dataManager,flickManager: flickManager),
                  ),
                ),
              ),


            ],
          ),
        )

    );

  }
}


