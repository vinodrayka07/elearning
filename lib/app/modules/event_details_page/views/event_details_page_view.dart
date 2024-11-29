import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_stack/image_stack.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/event_details_page_controller.dart';

class EventDetailsPageView extends GetView<EventDetailsPageController> {
  const EventDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
          appBar: PreferredSize(
            //preferredSize:  Size.fromHeight(80.0)
            preferredSize: Size.fromHeight(150.px),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0XFF16171B), Color(0XFF24252A)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: <Widget>[
                  Obx(() {
                    controller.count.value;
                    return controller.getEventDetails?.result == null
                        ? Center(child: Text("Loading"))
                        : CommonWidget.imageView(
                        borderRadius: BorderRadius.circular(30.px),
                        image: controller
                            .getEventDetails!.result!.images!.first.image!,
                        width: double.infinity,
                        height: 210.px);
                  }),
                  controller.dataBool
                      ? Align(
                    alignment: Alignment.centerRight,
                    child: Card(
                      color: ApkColors.primaryColor,margin: EdgeInsets.only(right: 10),
                      shadowColor: ApkColors.primaryColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.px)),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0XFF16171B),
                                Color(0XFF24252A)
                              ]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(
                            CupertinoIcons.person_add_solid,
                            color: ApkColors.greenColor,
                          ),
                        ),
                      ),
                    ),
                  )
                      : SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          //color: CupertinoColors.activeBlue
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ApkColors.backgroundColor,
                                ApkColors.backgroundfadeColor
                              ]),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Card(
                          color: ApkColors.primaryColor,margin: EdgeInsets.only(left: 10),
                          shadowColor: ApkColors.primaryColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.px)),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0XFF16171B),
                                    Color(0XFF24252A)
                                  ]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                CupertinoIcons.back,
                                color: ApkColors.greenColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                        //  color: CupertinoColors.activeOrange
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ApkColors.backgroundfadeColor,
                                ApkColors.backgroundColor
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),



          body: Obx(() {
            controller.count.value;
            return Stack(
               children: [



                 SingleChildScrollView(
                     child: controller.getEventDetails != null
                         ? Column(
                       children: [
                         const SizedBox(
                           height: 20,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Expanded(
                               child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: 20),
                                 color: ApkColors.backgroundColor,
                                 child: Text(
                                   controller.getEventDetails?.result?.title ??
                                       "The Aston Vill Hotel",
                                   overflow: TextOverflow.ellipsis,
                                   style: TextStyle(
                                       fontFamily: 'Nunito-Bold',
                                       fontWeight: FontWeight.w800,
                                       color: ApkColors.greenColor,
                                       fontSize: 15.px),
                                 ),
                               ),
                             ),
                             Row(
                               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Container(
                                   // alignment: Alignment.center,
                                   // color: ApkColors.orangeColor,
                                   height: 20,
                                   width: 20,

                                   child: const Icon(
                                       size: 20,
                                       Icons.star_rate_rounded,
                                       color: ApkColors.orangeColor),
                                 ),
                                 const SizedBox(
                                   width: 10,
                                 ),
                                 Text(
                                   controller.getEventDetails?.result?.rating ??
                                       "The Aston Vill Hotel",
                                   style: const TextStyle(
                                       color: ApkColors.greenColor,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 12),
                                 ),
                                 const SizedBox(
                                   width: 20,
                                 ),
                               ],
                             ),
                           ],
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Obx(() {
                           controller.count.value;
                           return controller.getEventDetails?.result?.favUsers != null  ? Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 20),
                             child: GestureDetector(
                               onTap: () {
                                 // controller.clickOnItem(1);


                               },
                               child: ImageStack(

                                 imageList: controller.images,
                                 imageRadius: 40,
                                 // Radius of each images
                                 imageCount: 5,
                                 backgroundColor: ApkColors.primaryColor,
                                 // Maximum number of images to be shown
                                 imageBorderWidth: 2,
                                 totalCount: 2,
                                 imageBorderColor: ApkColors.primaryColor,
                                 extraCountBorderColor: ApkColors.primaryColor,
                                 extraCountTextStyle: TextStyle(
                                     fontFamily: 'Nunito-Bold',
                                     fontWeight: FontWeight.w800,
                                     color: ApkColors.greenColor,
                                     fontSize: 19.px),

                                 showTotalCount:
                                 true, // Border width around the images
                               ),
                             ),
                           ): Container(
                             height: 20,
                             color:ApkColors.greenColor,
                           );
                         }),
                         const SizedBox(
                           height: 10,
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                               horizontal: 20, vertical: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceBetween,
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: ApkColors.primaryColor,
                                     radius: 20.px,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(40),
                                       child: const Icon(
                                         CupertinoIcons.calendar,
                                         color: ApkColors.orangeColor,
                                         size: 25,
                                       ),
                                     ),
                                     //CircleAvatar
                                   ),
                                   SizedBox(
                                     width: 15.px,
                                   ),
                                   Column(
                                     crossAxisAlignment:
                                     CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         controller.getEventDetails?.result?.dateTime ??
                                             "10 September, 2023",
                                         maxLines: 2,
                                         style: TextStyle(
                                             fontFamily: 'Nunito-Bold',
                                             fontWeight: FontWeight.bold,
                                             color: ApkColors.greenColor,
                                             fontSize: 16.px),
                                       ),
                                       Text(
                                         "Tuesday, 8:00AM-11:00AM",
                                         style: TextStyle(
                                             fontFamily: 'Nunito-Bold',
                                             fontWeight: FontWeight.normal,
                                             color: ApkColors.orangeColor,
                                             fontSize: 12.px),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                               horizontal: 20, vertical: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               CircleAvatar(
                                 backgroundColor: ApkColors.primaryColor,
                                 radius: 20.px,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(40),
                                   child: const Icon(
                                     CupertinoIcons.location_solid,
                                     color: ApkColors.orangeColor,
                                     size: 25,
                                   ),
                                 ),
                                 //CircleAvatar
                               ),
                               SizedBox(
                                 width: 15.px,
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 // mainAxisSize: MainAxisSize.max,
                                 children: [
                                   // Row(
                                   // //  mainAxisSize: MainAxisSize.min,
                                   //   children: [
                                   //     Expanded(
                                   //       // color: CupertinoColors.activeBlue,
                                   //
                                   //       child: Text(
                                   //         "10 SeptembeW, 2023madhfhjdgjhsdgfjgfjhgfjhgfjgfjahdghaa",
                                   //         softWrap: false,
                                   //         maxLines: 1,
                                   //         overflow: TextOverflow.ellipsis,
                                   //         style:  TextStyle(
                                   //             fontFamily: 'Nunito-Bßold',
                                   //
                                   //
                                   //             fontWeight: FontWeight.bold, fontSize: 16.px),
                                   //       ),
                                   //     ),
                                   //   ],
                                   // ),

                                   Row(
                                     children: [
                                       Container(
                                         margin: EdgeInsets.only(right: 20),
                                         width: 250.px,
                                         child: Text(
                                           controller.getEventDetails?.result?.address! ??
                                               "nxbhbv",

                                           style: TextStyle(fontSize: 16),
                                           softWrap: false,
                                           maxLines: 2,
                                           overflow:
                                           TextOverflow.ellipsis, // new
                                         ),
                                       ),
                                     ],
                                   ),

                                   Text(
                                     "Tuesday, 8:00AM-11:00AM",
                                     style: TextStyle(
                                         fontFamily: 'Nunito-Bold',
                                         fontWeight: FontWeight.normal,
                                         color: ApkColors.orangeColor,
                                         fontSize: 12.px),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Container(
                           color: ApkColors.greenColor,
                           height: 1,
                           margin: const EdgeInsets.symmetric(horizontal: 40),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                               horizontal: 20, vertical: 20),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceBetween,
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: ApkColors.primaryColor,
                                     radius: 25.px,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(25),
                                       child: Image.asset(
                                         'assets/images/avtarlogo.png',
                                         fit: BoxFit.cover,
                                         height: 50.px,
                                         width: 50.px,
                                       ),
                                     ),
                                     //CircleAvatar
                                   ),
                                   SizedBox(
                                     width: 15.px,
                                   ),
                                   Column(
                                     crossAxisAlignment:
                                     CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         controller.getEventDetails?.result?.eventUser?.userName ??
                                             "Welcome",
                                         style: TextStyle(
                                             fontFamily: 'Nunito-Bold',
                                             fontWeight: FontWeight.w800,
                                             color: ApkColors.greenColor,
                                             fontSize: 19.px),
                                       ),
                                       Text(
                                         controller.getEventDetails?.result?.eventUser?.email ??
                                             "vinod rayka...",
                                         style: TextStyle(
                                             fontFamily: 'Nunito-Bold',
                                             fontWeight: FontWeight.w400,
                                             color: ApkColors.orangeColor,
                                             fontSize: 14.px),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: EdgeInsets.symmetric(horizontal: 20),
                           child: Text(
                             "About Event",
                             style: TextStyle(
                                 fontFamily: 'Nunito-Bold',
                                 fontWeight: FontWeight.w800,
                                 color: ApkColors.greenColor,
                                 fontSize: 19.px),
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: const EdgeInsets.symmetric(horizontal: 20),
                           child: Wrap(
                             direction: Axis.horizontal,
                             runSpacing: 10,
                             children: [
                               Text(
                                 controller.getEventDetails?.result?.about ??
                                     "Lorem ipsum dolor sit amet consectetur. Lacus maecenas volutpat ipsum magna pharetra eu tellus. Vel vestibulum quis ut enim id dui amet diam arcu. Id convallis tincidunt amet ornare eget. Fermentum sed risus in gravida ut amet. Ac leo vitae elementum feugiat neque pharetra cursus. Lectus eget urna lectus neque suspendisse sit tempor.",
                                 maxLines: 5,
                                 overflow: TextOverflow.fade,
                                 style: TextStyle(
                                     fontFamily: 'Nunito-Bold',
                                     fontWeight: FontWeight.w400,
                                     color: ApkColors.greenColor,
                                     fontSize: 14.px),
                               ),
                               GestureDetector(
                                 onTap: () {},
                                 child: Container(
                                   width: 80,
                                   height: 20,
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     color: ApkColors.orange20Color,
                                     borderRadius: BorderRadius.circular(15),
                                     // border: Border.all(color:ApkColors.greenColor,
                                     //   width: 0.5),
                                   ),
                                   child: Text(
                                     "Read More..",
                                     overflow: TextOverflow.ellipsis,
                                     style: TextStyle(
                                         fontSize: 14.px,
                                         fontWeight: FontWeight.w700,
                                         fontFamily: 'Nunito-Bold',
                                         color: ApkColors.orangeColor),
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 20),
                               color: ApkColors.backgroundColor,
                               child: Text(
                                 'Gallery (Pre-Event)',
                                 style: TextStyle(
                                     fontFamily: 'Nunito-Bold',
                                     fontWeight: FontWeight.w800,
                                     color: ApkColors.greenColor,
                                     fontSize: 19.px),
                               ),
                             ),
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 20),
                               child: Text(
                                 'See all',
                                 style: TextStyle(
                                     color: ApkColors.orangeColor,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 14.px),
                               ),
                             ),
                           ],
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Obx(() {
                           controller.count.value;
                           return (controller.getEventDetails?.result != null
                               ? SizedBox(
                             height: 180.px,
                             child: ListView.builder(
                                 itemCount: controller.getEventDetails
                                     ?.result?.images?.length,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (context, index) {
                                   final item = controller.getEventDetails
                                       ?.result?.images?[index];
                                   return GestureDetector(
                                     onTap: () {},
                                     child: Container(
                                       width: 180.px,
                                       margin: const EdgeInsets.all(10),
                                       padding: const EdgeInsets.all(5),
                                       decoration: BoxDecoration(
                                         borderRadius:
                                         BorderRadius.circular(30),
                                         color: ApkColors.backgroundColor,
                                       ),
                                       child: Column(
                                         crossAxisAlignment:CrossAxisAlignment.center,
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           CommonWidget.imageView(
                                               borderRadius:
                                               BorderRadius.circular(
                                                   30.px),
                                               image: item?.image ?? "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_24096.png",
                                               width: double.infinity,
                                               height: 140.px),
                                         ],
                                       ),
                                     ),
                                   );
                                 }),
                           )
                               : SizedBox(
                             height: 200,
                             child: Shimmer.fromColors(
                                 baseColor: const Color(0XFF24252A),
                                 highlightColor: ApkColors.backgroundColor,
                                 enabled: true,
                                 child: ListView.builder(
                                     physics:
                                     const NeverScrollableScrollPhysics(),
                                     shrinkWrap: true,
                                     itemCount: 6,
                                     scrollDirection: Axis.horizontal,
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 10),
                                     itemBuilder: (BuildContext context,
                                         int index) {
                                       return CommonWidget.commonShimmer(
                                           shimmerWidget: Container(
                                             height: 100.px,
                                             width: 180.px,
                                             margin:
                                             const EdgeInsets.all(10),
                                             padding:
                                             const EdgeInsets.all(20),
                                             decoration: BoxDecoration(
                                               borderRadius:
                                               BorderRadius.circular(
                                                   30),
                                               color:
                                               ApkColors.primaryColor,
                                               border: Border.all(
                                                   color: ApkColors
                                                       .greenColor,
                                                   width: 1),
                                             ),
                                           ),
                                           itemCount: 6);
                                     })),
                           ));
                         }),
                         const SizedBox(
                           height: 20,
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: EdgeInsets.symmetric(horizontal: 20),
                           child: Text(
                             "Location",
                             style: TextStyle(
                                 fontFamily: 'Nunito-Bold',
                                 fontWeight: FontWeight.w800,
                                 color: ApkColors.greenColor,
                                 fontSize: 19.px),
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 20),
                               child: const Icon(
                                 CupertinoIcons.location_solid,
                                 color: ApkColors.orangeColor,
                                 size: 25,
                               ),
                             ),
                             Expanded(
                               child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: 10),
                                 // width: double.infinity,
                                 // color: ApkColors.orangeColor,
                                 child: Text(
                                   controller.getEventDetails?.result?.address ??
                                       'Grand Park. New York',
                                   overflow: TextOverflow.ellipsis,
                                   maxLines: 2,
                                   style: TextStyle(
                                       fontFamily: 'Nunito-Bold',
                                       fontWeight: FontWeight.w800,
                                       color: ApkColors.greenColor,
                                       fontSize: 14.px),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Obx(() {
                           controller.count.value;
                           return Padding(
                               padding: EdgeInsets.all(20),
                               child: SizedBox(
                                 height: 250.px,
                                 child: ClipRRect(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(30)),
                                   child: GoogleMap(
                                     mapType: MapType.normal,
                                     myLocationButtonEnabled: true,
                                     myLocationEnabled: true,
                                     initialCameraPosition: CameraPosition(
                                       target:
                                       LatLng(
                                           double.parse(controller.getEventDetails!.result!.lat!) ,
                                           double.parse(controller
                                               .getEventDetails!
                                               .result!
                                               .long!)),
                                       zoom: 14.4746,
                                     ),
                                     gestureRecognizers: {
                                       Factory<OneSequenceGestureRecognizer>(
                                               () => EagerGestureRecognizer())
                                     },
                                     onMapCreated:
                                         (GoogleMapController googleController) {
                                       controller.mapcontroller
                                           .complete(googleController);
                                       controller.mapcontroller.future
                                           .then((value) {
                                         value.setMapStyle(
                                             controller.mapStyleString);
                                       });
                                     },
                                     markers: {
                                       Marker(
                                         markerId: MarkerId('marker_1'),
                                         position:
                                         LatLng(
                                             double.parse(controller
                                                 .getEventDetails!
                                                 .result!
                                                 .lat!),
                                             double.parse(controller
                                                 .getEventDetails!
                                                 .result!
                                                 .long!)),
                                       ),
                                     },
                                   ),
                                 ),
                               ));
                         }),


                         SizedBox(
                           height: 100.px,
                         )

                       ],
                     )
                         : Column(
                       children: [
                         SizedBox(
                           height: 20,
                         ),
                         SizedBox(
                           height: 50,
                           child: Shimmer.fromColors(
                               baseColor: ApkColors.primaryColor,
                               highlightColor: ApkColors.greenColor,
                               enabled: true,
                               child: Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     width: 120,
                                     alignment: Alignment.centerLeft,
                                     margin: const EdgeInsets.only(
                                       top: 10,
                                       bottom: 10,
                                     ),
                                     decoration: BoxDecoration(
                                       color: ApkColors.darkgreenColor,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                   ),
                                   Container(
                                     width: 50,
                                     alignment: Alignment.centerLeft,
                                     margin: const EdgeInsets.only(
                                         top: 10, bottom: 10, right: 20),
                                     decoration: BoxDecoration(
                                       color: ApkColors.darkgreenColor,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                   ),
                                 ],
                               )),
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         SizedBox(
                           height: 50,
                           child: Shimmer.fromColors(
                               baseColor: ApkColors.primaryColor,
                               highlightColor: ApkColors.greenColor,
                               enabled: true,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     width: 20,
                                   ),
                                   Container(
                                     width: 50,
                                     alignment: Alignment.centerLeft,
                                     decoration: BoxDecoration(
                                       color: ApkColors.darkgreenColor,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                   ),
                                   Container(
                                     width: 50,
                                     alignment: Alignment.centerLeft,
                                     decoration: BoxDecoration(
                                       color: ApkColors.darkgreenColor,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                   ),
                                   Container(
                                     width: 50,
                                     alignment: Alignment.centerLeft,
                                     decoration: BoxDecoration(
                                       color: ApkColors.darkgreenColor,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                   ),
                                   Container(
                                     width: 50,
                                     alignment: Alignment.centerLeft,
                                     decoration: BoxDecoration(
                                       color: ApkColors.darkgreenColor,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                   ),
                                 ],
                               )),
                         ),
                       ],
                     )
                 ),
                 controller.dataBool
                     ? Align(
                   alignment: Alignment.bottomCenter,
                   child: GestureDetector(
                     onTap: () {

                       controller.clickOnItem(0);
                       // controller.dataCheck();
                     },
                     child: Container(
                         height: 60,
                         alignment: Alignment.center,
                         margin: const EdgeInsets.symmetric(
                             horizontal: 30,vertical: 30),
                         decoration: BoxDecoration(
                             color: Color(0XFF15C55D),
                             borderRadius: BorderRadius.all(
                                 Radius.circular(15))),
                         child: controller.isBtnLoading.value
                             ? const RefreshProgressIndicator(
                           backgroundColor:
                           ApkColors.backgroundColor,
                         )
                             : Text(
                           "Edit Event",
                           style: TextStyle(
                               fontFamily: 'Nunito-Bold',
                               fontWeight: FontWeight.bold,
                               color: ApkColors
                                   .backgroundColor,
                               backgroundColor:
                               Colors.transparent,
                               fontSize: 20.px),
                         )),
                   ),
                 )

                     : SizedBox(),
               ],
            );
          })

        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed:(){controller.goToTheLake();} ,
        //   label: const Text('To the lake!'),
        //   icon: const Icon(Icons.directions_boat),
        // ),
      );
    });


  }
}
