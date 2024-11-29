import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:elearner/app/modules/home/controllers/home_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Categories.dart';
import '../Models/OpeningCourse.dart';
import '../Models/RecommendedCourse.dart';
import '../app/colors/ApkColors.dart';
import '../app/routes/app_pages.dart';

String? data;

final databaseRef = FirebaseDatabase.instance.ref('Categories');

//bool dataiscome = false;

class Common_listviews {
  static Widget categorySelection(
      {bool dataiscome = false, DatabaseReference? mydatabaseRef,
        VoidCallback? onPressed,

      }) {
    return StreamBuilder(
        stream: mydatabaseRef?.onValue ?? databaseRef.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  CommonWidget.commonShimmer(
                shimmerWidget: Container(
              height: Get.height * 0.16,
              width: Get.width * 0.2,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              //alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ApkColors.primaryColor,
                border: Border.all(
                  // color: indexCategory == index
                  //     ?
                    color: ApkColors.greenColor,
                    //: Colors.transparent,
                    width: 1),
                //color: Colors.cyan,
              ),),itemCount: 6
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Text('No data available');
          }

          List<dynamic>? list = [];

          // Assuming data is Map<dynamic, dynamic> or can be safely casted
          if (snapshot.data!.snapshot.value != null) {
            // Cast snapshot data to List<dynamic>
            list = snapshot.data!.snapshot.value as List?;
            //dataiscome = true;
          }

          return  Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    height: Get.height * 0.16,
                    child: ListView.builder(
                        itemCount: list?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          //  Categories categories = Categories.cateItem[index];
                          return GestureDetector(
                            onTap:onPressed ?? () {

                              // print(categories.name);
                              Get.offNamed(Routes.DATA_VIEWPAGE,arguments: list?[index]['otherurl']);
                             // Get.snackbar("hhh", "${list?[index]['otherurl']}");
                            },
                            child: Container(
                              height: Get.height * 0.10,
                              width: Get.width * 0.20,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ApkColors.primaryColor,
                                border: Border.all(
                                    // color: indexCategory == index
                                    //     ?
                                    color: ApkColors.greenColor,
                                    //: Colors.transparent,
                                    width: 1),
                                //color: Colors.cyan,
                              ),

                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ApkColors.greenColor,
                                    radius: 25,
                                    child: CircleAvatar(
                                      backgroundColor: ApkColors.primaryColor,
                                      // backgroundColor: Colors.purple,
                                      radius: 23,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          list?[index]['imageurl'],
                                          fit: BoxFit.cover,
                                          height: 40,
                                          width: 40,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return  CommonWidget.commonShimmer(
                                                shimmerWidget: Container(
                                                  height: Get.height * 0.4,
                                                  width: Get.width * 0.4,

                                            ));
                                          },
                                        ),
                                      ),
                                      //CircleAvatar
                                    ), //CircleAvatar
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    // color: Colors.purple,
                                    alignment: Alignment.bottomCenter,
                                    //height: 30,
                                    //width: 100,
                                    // padding: EdgeInsets.all(5),
                                    child: Text(
                                      list?[index]['title'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Nunito-Bold',
                                          // color: indexCategory == index
                                          //     ?
                                          color: ApkColors.orangeColor,
                                          // :ApkColors.greenColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                );


        });
  }

  static Widget openingSelection({
    bool dataiscome = false,
  }) {
    var colors1 = [
      Color(0XFF714D7D),
      Color(0XFF4D7D78),
      Color(0XFF4D7D55),
      Color(0XFF7D794D),
      Color(0XFF6E1A4C),
    ];

    return Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: SizedBox(
          height: Get.height * 0.220,
          child: ListView.builder(
              itemCount: OpeningCourse.openingCourceitem.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                OpeningCourse openingCourse =
                    OpeningCourse.openingCourceitem[index];

                return Obx(() {
                  HomeController().count.value;
                  return GestureDetector(
                    onTap: () {
                      Get.snackbar(
                          "hhh", "${openingCourse.name1}+${index.toString()}");
                      print(openingCourse.name1);
                    },
                    child: Container(
                      height: Get.height * 0.180,
                      width: Get.height * 0.310,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colors1[index],
                        //color: Colors.cyan,
                      ),

                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: CircleAvatar(
                                  backgroundColor: ApkColors.primaryColor,
                                  // backgroundColor: Colors.purple,
                                  radius: 23,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      openingCourse.image1,
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.3,
                                      width: Get.width * 0.3,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: ApkColors.greenColor,
                                          ),
                                        );
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(
                                          Icons.error,
                                          size: 50,
                                          color: Colors.red,
                                        );
                                      },
                                    ),
                                  ),
                                  //CircleAvatar
                                ), //CircleAvatar
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                // color: Colors.purple,
                                width: 160,
                                alignment: Alignment.centerLeft,
                                //height: 30,
                                //width: 100,
                                // padding: EdgeInsets.all(5),
                                child: Text(
                                  openingCourse.name1,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito-Bold',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                decoration: const BoxDecoration(),
                                child: const LinearProgressIndicator(
                                  borderRadius: BorderRadius.zero,

                                  //value: 50,
                                  backgroundColor: Colors.white38,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    ApkColors.greenColor,
                                  ),
                                  value: 0.8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //  color: Colors.purple,
                                  alignment: Alignment.centerLeft,

                                  //width: 80,
                                  // padding: EdgeInsets.all(5),
                                  child: Text(
                                    openingCourse.videocount,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Nunito-Bold',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // color: Colors.cyan,
                                  alignment: Alignment.centerRight,
                                  //height: 30,
                                  // width: 80,
                                  // padding: EdgeInsets.all(5),
                                  child: Text(
                                    openingCourse.Exercises,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Nunito-Bold',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                //color: Colors.purple,
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),

                                //width: 80,
                                // padding: EdgeInsets.all(5),
                                child: Text(
                                  openingCourse.RieViews,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito-Bold',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //  const SizedBox(
                              //   width: 10,
                              // ),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Container(
                                      //color: Colors.cyan,
                                      alignment: Alignment.centerRight,
                                      //height: 30,
                                      // width: 80,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),

                                      // padding: EdgeInsets.all(5),
                                      child: Text(
                                        openingCourse.Rating,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Nunito-Bold',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }),
        ));
  }

  static Widget RecommendedCourceSelection({bool dataiscome = false}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 165,
        child: ListView.builder(
            itemCount: Recommendedcourse.Recommendeditem.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Recommendedcourse recommendedcourse =
                  Recommendedcourse.Recommendeditem[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: Get.height * 0.200,
                  width: Get.width * 0.540,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ApkColors.primaryColor,
                    //color: Colors.cyan,
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        recommendedcourse.imageofitem,
                        fit: BoxFit.fill,
                        height: Get.height * 0.100,
                        width: Get.width * 0.540,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator(
                            color: ApkColors.greenColor,
                          ));
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(
                            Icons.error,
                            size: 50,
                            color: Colors.red,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            //color: Colors.purple,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(horizontal: 10),

                            //width: 80,
                            // padding: EdgeInsets.all(5),
                            child: Text(
                              recommendedcourse.namerecommended,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Nunito-Bold',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          //  const SizedBox(
                          //   width: 10,
                          // ),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Container(
                                  //color: Colors.cyan,
                                  alignment: Alignment.centerRight,
                                  //height: 30,
                                  // width: 80,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),

                                  // padding: EdgeInsets.all(5),
                                  child: Text(
                                    recommendedcourse.Rating,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Nunito-Bold',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }



}
