import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';
import 'flick_video_speed_control_slider_widget.dart';

class CustomOrientationControls extends StatefulWidget {
  CustomOrientationControls(
      {Key? key,
      this.iconSize = 20,
      this.fontSize = 12,
      this.dataManager,
      required this.flickManager})
      : super(key: key);
  final double iconSize;
  final double fontSize;
  final DataManager? dataManager;
  late FlickManager flickManager;

  @override
  _CustomOrientationControls createState() => _CustomOrientationControls();
}

class _CustomOrientationControls extends State<CustomOrientationControls> {
  bool click = false;
  bool autohide = true;

  @override
  Widget build(BuildContext context) {
    print(autohide);
    print(click);
    FlickVideoManager flickVideoManager =
        Provider.of<FlickVideoManager>(context);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    autohide = !autohide;
                  },
                  child: Container(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: FlickAutoHideChild(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   // widget.flickManager.flickControlManager!.isFullscreen
                    Center(
                      child: flickVideoManager.nextVideoAutoPlayTimer != null
                          ? FlickAutoPlayCircularProgress(
                              colors: FlickAutoPlayTimerProgressColors(
                                backgroundColor: Colors.white30,
                                color: Colors.red,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.dataManager!.skipToPreviousVideo();
                                    },
                                    child: Icon(
                                      Icons.skip_previous,
                                      color:
                                          widget.dataManager!.hasPreviousVideo()
                                              ? Colors.white
                                              : Colors.white38,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlickPlayToggle(size: 50),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.dataManager!.skipToNextVideo();
                                    },
                                    child: Icon(
                                      Icons.skip_next,
                                      color: widget.dataManager!.hasNextVideo()
                                          ? Colors.white
                                          : Colors.white38,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            autoHide: autohide,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1000),
                    opacity: click ? 1.0 : 0.0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child:
                      Container(
                        margin: EdgeInsets.only(right: 50),
                        // color:Colors.grey.withOpacity(0.9),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0XFF16171B), Color(0XFF24252A)]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(10),
                        child:

                        Column(
                          children: [
                            InkWell(
                                child: const Text(
                                  "0.5",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ApkColors.greenColor),
                                ),
                                onTap: () {}),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                                child: const Text("1.0",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ApkColors.greenColor)),
                                onTap: () {}),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                                child: const Text("1.5",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ApkColors.greenColor)),
                                onTap: () {}),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                                child: const Text("2.0",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ApkColors.greenColor)),
                                onTap: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: widget.fontSize,
                          ),
                          Text(
                            ' / ',
                            style: TextStyle(
                                color: Colors.white, fontSize: widget.fontSize),
                          ),
                          FlickTotalDuration(
                            fontSize: widget.fontSize,
                          ),
                        ],
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.black38,
                      )),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            autohide = !autohide;
                            click = !click;
                          });
                        },
                        icon: click
                            ? Icon(
                                Icons.speed_rounded,
                                color: ApkColors.greenColor,
                                size: widget.iconSize,
                              )
                            : Icon(Icons.speed, size: widget.iconSize),
                      ),

                      FlickSoundToggle(
                        size: widget.iconSize,
                      ),

                      FlickFullScreenToggle(
                        size: widget.iconSize,
                      ),


                      // FlickVideoSpeedControlWidget(click1: false,flickManager: widget.flickManager,listvisible: false,btnvisible: true,),

                      // Row(
                      //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         setState(() {
                      //
                      //           autohide =! autohide;
                      //           click = ! click;
                      //
                      //         });
                      //
                      //       },
                      //       icon: click ?  Icon(Icons.speed_rounded,color: ApkColors.greenColor,
                      //       size: widget.iconSize,):  Icon(Icons.speed,size: widget.iconSize
                      //       ),
                      //     ),
                      //
                      //      FlickSoundToggle(
                      //       size: widget.iconSize,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     FlickFullScreenToggle(
                      //       size: widget.iconSize,
                      //     ),
                      //
                      //   ],
                      // ),
                    ],
                  ),
                  FlickVideoProgressBar(
                    flickProgressBarSettings: FlickProgressBarSettings(
                      height: 5,
                      handleRadius: 5,
                      curveRadius: 50,
                      backgroundColor: Colors.white24,
                      bufferedColor: Colors.white38,
                      playedColor: Colors.red,
                      handleColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


