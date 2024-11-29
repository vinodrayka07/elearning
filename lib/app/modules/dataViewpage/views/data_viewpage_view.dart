import 'package:elearner/app/colors/ApkColors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/data_viewpage_controller.dart';

class DataViewpageView extends GetView<DataViewpageController> {
  const DataViewpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApkColors.backgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                //color: Colors.cyan,
                decoration: const BoxDecoration(
                    // color: Colors.red,
                    //   borderRadius: BorderRadius.circular(20),
                    //   border: Border.all(color: Colors.green,width: 5),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0X4015C55D), Color(0XFF16171B)])),
                // margin: const EdgeInsets.symmetric(horizontal: 15),
                //padding: const EdgeInsets.only(right: 5),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      decoration: BoxDecoration(
                          color: Color(0XFF16171B),
                          borderRadius: BorderRadius.circular(20)),
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          Get.offNamed(Routes.HOME);
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Color(0XFF15C55D),
                        ),
                      ),
                    ),
                    CommonWidget.commonSearchView(
                        onPressed: () {
                          // Get.offNamed(Routes.VIDEO);
                          Get.snackbar(
                              "hhh", "${controller.data ?? "no data"}");
                        },
                        margin: const EdgeInsets.only(left: 50, right: 15),
                        bgcolor: ApkColors.backgroundColor),
                  ],
                ),
              ),
            ],
          ),
          Obx(() {
            controller.listvelue.value;
            return Expanded(
              child: StreamBuilder(
                stream: controller.databaseRef?.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CommonWidget.commonShimmer(
                        vertical: true,
                        wantgrid: false,
                        shimmerWidget: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ApkColors.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        itemCount: 6);
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Image.asset(
                        'assets/images/nodata.png',
                        height: 400,
                        fit: BoxFit.fill,
                      ),
                    );
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return Text("ddjf");
                  }

                  List<dynamic>? list = [];

                  // Assuming data is Map<dynamic, dynamic> or can be safely casted
                  if (snapshot.data!.snapshot.value != null) {
                    // Cast snapshot data to List<dynamic>
                    list = snapshot.data!.snapshot.value as List?;
                  }
                  // list = map.values.toList();
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: list?.length,
                    physics: const ClampingScrollPhysics(),
                    // padding: const EdgeInsets.all(5),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // controller.data = list?[index]['otherurl'];
                            // controller.listvelueLoad();
                          },
                          child: Container(
                            margin: EdgeInsets.all(15),
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0XFF24252A),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ApkColors.greenColor,
                                // Adjust color as needed
                                width: 1.0, // Adjust width as needed
                              ),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(children: [
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      list?[index]['imageurl'],
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.fitHeight,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;

                                        return Center(
                                          child: Shimmer.fromColors(
                                            baseColor: Color(0XFF24252A),
                                            highlightColor:
                                                ApkColors.backgroundColor,
                                            enabled: true,
                                            child: Container(
                                              //margin: EdgeInsets.all(10),
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: ApkColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Center(
                                          child: Icon(
                                            Icons.error,
                                            size: 80,
                                            color: Colors.red,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Text(
                                            list?[index]['title'],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontFamily: 'Nunito-Bold',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Color(0XFF15c55D)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: Row(
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
                                                      color:
                                                          ApkColors.greenColor),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  list?[index]['ratings'],
                                                  style: const TextStyle(
                                                      color:
                                                          ApkColors.greenColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  //alignment: Alignment.center,
                                                  // color: ApkColors.orangeColor,
                                                  height: 20,
                                                  width: 20,
                                                  child: const Icon(
                                                      Icons.person_pin,
                                                      size: 20,
                                                      color:
                                                          ApkColors.greenColor),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  list?[index]['views'],
                                                  style: const TextStyle(
                                                      color:
                                                          ApkColors.greenColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  //alignment: Alignment.center,
                                                  // color: ApkColors.orangeColor,
                                                  height: 20,
                                                  width: 20,
                                                  child: const Icon(
                                                      Icons.translate_rounded,
                                                      size: 20,
                                                      color:
                                                          ApkColors.greenColor),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  list?[index]['language'],
                                                  style: const TextStyle(
                                                      color:
                                                          ApkColors.greenColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  color: ApkColors.greenColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  child: InkWell(
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        list?[index]['price'],
                                        style: TextStyle(
                                            color: ApkColors.backgroundColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ));
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
