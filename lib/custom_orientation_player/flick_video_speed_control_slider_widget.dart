import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/colors/ApkColors.dart';

class FlickVideoSpeedControlWidget extends StatefulWidget {


   FlickVideoSpeedControlWidget({Key? key,
     this.flickManager,
     this.click1,
     this.btnvisible,
     this.listvisible,
   }) : super(key: key);
   final FlickManager? flickManager;
    bool? click1= false;
    bool? btnvisible= true;
    bool? listvisible= false;

  @override
  _FlickVideoSpeedControlWidget createState() =>
      _FlickVideoSpeedControlWidget();

}

class _FlickVideoSpeedControlWidget extends State<FlickVideoSpeedControlWidget> {
  bool invisibleicon = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ApkColors.backgroundColor,
        body: Expanded(
          child:  Column(children: [
            Visibility (
              visible: widget.btnvisible!,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.click1 = true;
                    widget.btnvisible= false;
                    widget.listvisible= true;
                    // invisibleicon = false;
                  });
                },
                icon: Icon(Icons.ice_skating),
              ),
            ),
            Visibility(
              visible: widget.listvisible!,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(left: 250),
                  // color:Colors.grey.withOpacity(0.9),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFF16171B),
                          Color(0XFF24252A)
                        ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        child: ListView(
                          // Important: Remove any padding from the ListView.
                          //padding: EdgeInsets.zero,
                          shrinkWrap: false,
                          children: <Widget>[
                            ListTile(
                              title: const Text(
                                '0.5x',
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight:
                                    FontWeight.bold,
                                    color:
                                    ApkColors.greenColor,
                                    fontSize: 12),
                              ),
                              minTileHeight: 20,
                              hoverColor: Colors.purple,
                              tileColor: Colors.blue,
                              onTap: () {

                              },
                            ),
                            ListTile(
                              title: const Text(
                                '1x',
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight:
                                    FontWeight.bold,
                                    color:
                                    ApkColors.greenColor,
                                    fontSize: 12),
                              ),
                              minTileHeight: 20,
                              onTap: () {},
                            ),
                            ListTile(
                              title: const Text(
                                '1.5x',
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight:
                                    FontWeight.bold,
                                    color:
                                    ApkColors.greenColor,
                                    fontSize: 12),
                              ),
                              minTileHeight: 20,
                              onTap: () {},
                            ),
                            ListTile(
                              title: const Text(
                                '2x',
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight:
                                    FontWeight.bold,
                                    color:
                                    ApkColors.greenColor,
                                    fontSize: 12),
                              ),
                              minTileHeight: 20,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
          ),



        ),

    );

  }
}



