import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/my_subscriptio_page_controller.dart';

class MySubscriptioPageView extends GetView<MySubscriptioPageController> {
  const MySubscriptioPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 600.px,
          color: ApkColors.primaryColor,
          child: Image.asset(
            'assets/images/amuse.png',
            fit: BoxFit.cover,
            height: 500.px,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                //tileMode: TileMode.decal,
                colors: [Color(0X6015c55d), ApkColors.greenColor]),
            // borderRadius: BorderRadius.circular(30),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 230,
                margin: EdgeInsets.only(left: 20.px, right: 20, bottom: 20.px),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      //tileMode: TileMode.decal,
                      colors: [
                        ApkColors.primaryColor,
                        ApkColors.backgroundColor
                      ]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(

                     height: 180.px,
                      width: 95.px,
                      margin: EdgeInsets.symmetric(horizontal: 15.px,vertical: 15.px),
                      color: ApkColors.primaryColor,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/Group13937.png',
                            fit: BoxFit.cover,
                            height: 500.px,
                          ),
                          Align(
                            alignment: Alignment.center,

                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$ 12.00",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: ApkColors.backgroundColor,
                                      fontSize: 16.px),
                                ),
                                Text(
                                  "Per Month",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.w800,
                                      color: ApkColors.backgroundColor,
                                      fontSize: 9.px),
                                ),
                              ],
                            )

                          ),
                          Padding(
                            padding: EdgeInsets.only(top:20.px ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Per Month",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.backgroundColor,
                                    fontSize: 9.px),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/sitevector.png',
                      fit: BoxFit.fill,
                      height: 170.px,
                      width: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.px,bottom: 15.px),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 220.px,
                            child: ListTile(
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "No waiting time; events are visible immediately after creation.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Ability to see who is attending the events.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minTileHeight: 25,
                              minVerticalPadding: 5,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Ability to see who is attending the events.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minVerticalPadding: 5,
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Capability to schedule events that repeat. ",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.px,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.shopping_cart
                                    )
                                ),
                                //CircleAvatar
                              ),
                              Text(
                                "Upgrade Now",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ],
                          )


                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 230,
                margin: EdgeInsets.only(left: 20.px, right: 20, bottom: 20.px),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      //tileMode: TileMode.decal,
                      colors: [
                        ApkColors.primaryColor,
                        ApkColors.backgroundColor
                      ]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(

                     height: 180.px,
                      width: 95.px,
                      margin: EdgeInsets.symmetric(horizontal: 15.px,vertical: 15.px),
                      color: ApkColors.primaryColor,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/Group13937.png',
                            fit: BoxFit.cover,
                            height: 500.px,
                          ),
                          Align(
                            alignment: Alignment.center,

                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$ 18.00",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: ApkColors.backgroundColor,
                                      fontSize: 16.px),
                                ),
                                Text(
                                  "Per Month",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.w800,
                                      color: ApkColors.backgroundColor,
                                      fontSize: 9.px),
                                ),
                              ],
                            )

                          ),
                          Padding(
                            padding: EdgeInsets.only(top:20.px ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Per Month",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.backgroundColor,
                                    fontSize: 9.px),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/sitevector.png',
                      fit: BoxFit.fill,
                      height: 170.px,
                      width: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.px,bottom: 15.px),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 220.px,
                            child: ListTile(
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "No waiting time; events are visible immediately after creation.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Ability to see who is attending the events.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minTileHeight: 25,
                              minVerticalPadding: 5,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Ability to see who is attending the events.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minVerticalPadding: 5,
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Capability to schedule events that repeat. ",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.px,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.shopping_cart
                                    )
                                ),
                                //CircleAvatar
                              ),
                              Text(
                                "Upgrade Now",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ],
                          )


                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 230,
                margin: EdgeInsets.only(left: 20.px, right: 20, bottom: 20.px),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      //tileMode: TileMode.decal,
                      colors: [
                        ApkColors.primaryColor,
                        ApkColors.backgroundColor
                      ]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(

                     height: 180.px,
                      width: 95.px,
                      margin: EdgeInsets.symmetric(horizontal: 15.px,vertical: 15.px),
                      color: ApkColors.primaryColor,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/Group13937.png',
                            fit: BoxFit.cover,
                            height: 500.px,
                          ),
                          Align(
                            alignment: Alignment.center,

                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$ 22.15",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: ApkColors.backgroundColor,
                                      fontSize: 16.px),
                                ),
                                Text(
                                  "Per Month",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontWeight: FontWeight.w800,
                                      color: ApkColors.backgroundColor,
                                      fontSize: 9.px),
                                ),
                              ],
                            )

                          ),
                          Padding(
                            padding: EdgeInsets.only(top:20.px ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Per Month",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.backgroundColor,
                                    fontSize: 9.px),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/sitevector.png',
                      fit: BoxFit.fill,
                      height: 170.px,
                      width: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.px,bottom: 15.px),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 220.px,
                            child: ListTile(
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "No waiting time; events are visible immediately after creation.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Ability to see who is attending the events.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minTileHeight: 25,
                              minVerticalPadding: 5,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Ability to see who is attending the events.",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 220.px,

                            child: ListTile(
                              minVerticalPadding: 5,
                              minTileHeight: 25,
                              onTap: (){
                               // Get.toNamed(Routes.MY_EVENT_PAGE);
                              },
                              leading: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.check
                                    )
                                ),
                                //CircleAvatar
                              ),
                              title: Text(
                                "Capability to schedule events that repeat. ",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.px,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 10.px,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Icon(
                                        size: 10.px,
                                        Icons.shopping_cart
                                    )
                                ),
                                //CircleAvatar
                              ),
                              Text(
                                "Upgrade Now",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 10.px),
                              ),
                            ],
                          )


                        ],
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            // color: Colors.amber,
            // gradient: const LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0XFF16171B), Color(0XFF24252A)]),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Card(
                  color: ApkColors.primaryColor,
                  margin: EdgeInsets.only(left: 10),
                  shadowColor: ApkColors.primaryColor,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.px)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0XFF16171B), Color(0XFF24252A)]),
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
              const SizedBox(),
              Card(
                color: ApkColors.primaryColor,
                margin: EdgeInsets.only(right: 30),
                shadowColor: ApkColors.primaryColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.px)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0XFF16171B), Color(0XFF24252A)]),
                    borderRadius: BorderRadius.circular(50),
                  ),

                  //color: ApkColors.primaryColor,
                  child: Text(
                    "Skip",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        fontWeight: FontWeight.w500,
                        color: ApkColors.greenColor,
                        fontSize: 20.px),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
