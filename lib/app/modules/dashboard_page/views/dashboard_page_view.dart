import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../../../routes/app_pages.dart';
import '../../dataViewpage/controllers/data_viewpage_controller.dart';
import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardPageController());
    Get.lazyPut<DashboardPageController>(
      () => DashboardPageController(),
    );
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: ApkColors.backgroundColor,
        appBar: PreferredSize(
          //preferredSize:  Size.fromHeight(80.0)
          preferredSize: Size.fromHeight(180.px),
          child: Container(
            margin: EdgeInsets.only(top: 60.px, bottom: 0),
            decoration: BoxDecoration(
              color: ApkColors.backgroundColor,
              borderRadius: BorderRadius.circular(20.px),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: ApkColors.greenColor,
                            radius: 33.px,
                            child: CircleAvatar(
                              backgroundColor: ApkColors.primaryColor,
                              radius: 30.px,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CommonWidget.imageView(image: controller.userModel?.result?.image ?? "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png",
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
                          SizedBox(
                            width: 15.px,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome to ",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w800,
                                    color: ApkColors.greenColor,
                                    fontSize: 19.px),
                              ),
                              Text(
                                controller.userModel?.result?.email ?? "............",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.w400,
                                    color: ApkColors.greenColor,
                                    fontSize: 14.px),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: ApkColors.greenColor,
                            size: 25.px,
                          ),
                          SizedBox(
                            width: 20.px,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.FRIENDS_LIST_PAGE);
                            },
                            icon: Icon(
                              Icons.supervised_user_circle,
                              color: ApkColors.greenColor,
                              size: 25.px,
                            ),
                          ),
                          SizedBox(
                            width: 20.px,
                          ),
                          Icon(
                            Icons.notifications,
                            color: ApkColors.greenColor,
                            size: 25.px,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(
                      top: 10,),
                  shadowColor: Colors.black,
                  child: CommonWidget.commonSearchView(
                      onPressed: () {
                        Get.toNamed(Routes.SEARCH_PAGE);
                      },
                      tag: "SearchView",
                      bgcolor: ApkColors.primaryColor),
                ),

              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(
                    left: 10,right: 10),
                shadowColor: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    // color: ApkColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.px),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // height: 30,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:ApkColors.darkgreenColor,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child:  Text(
                            " Get 1 month of Premium in just 12" ,
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color :ApkColors.greenColor,
                                fontSize: 8.px),
                          ),
                        ),
                      ),

                      Container(
                        // height: 30,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                        decoration: BoxDecoration(
                          color:ApkColors.darkgreenColor,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child:  Text(
                            "GetPremium",
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color :ApkColors.greenColor,
                                fontSize: 8.px),
                          ),
                        ),
                      ),
                      Container(
                        // height: 30,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 10, ),
                        padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                        decoration: BoxDecoration(
                          // color:ApkColors.darkgreenColor,
                          border: Border.all(width: 2.px,color: ApkColors.darkgreenColor),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.MY_SUBSCRIPTIO_PAGE);
                          },
                          borderRadius: BorderRadius.circular(20),
                          child:  Text(
                            "View plan",
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color :ApkColors.greenColor,
                                fontSize: 8.px),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              CommonWidget.commonidendifire(
                  onPressed: () {
                    Get.snackbar("title", "sendFCMMessage");
                    //controller.sendFCMMessage();
                  },
                  bgcolor: Colors.green.withOpacity(0.2),
                  marginc: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  text: 'Featured',
                  tsize: 18),
              Obx(() {
                controller.count.value;
                return (controller.dashboardData?.result != null
                    ? SizedBox(
                        height: 330,
                        child: ListView.builder(
                            itemCount: controller
                                .dashboardData?.result?.featured?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = controller
                                  .dashboardData?.result?.featured?[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.clickOnItemFeature(0, index.toString(), "ok");
                                },
                                child: Container(
                                  width: 260,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ApkColors.primaryColor,
                                  ),
                                  child: Column(
                                    children: [
                                      CommonWidget.imageView(
                                          borderRadius:
                                              BorderRadius.circular(30.px),
                                          image:'https://server-php-8-2.technorizen.com/amuse/public/uploads/1726494135_8abe598ccb0a1ff980e7.jpg',
                                          width: double.infinity,
                                          height: 150.px),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item?.title ?? '',
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Nunito-Bold',
                                                color: Color(0XFF15C55D),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.star_rate_rounded,
                                                color: ApkColors.greenColor,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                item?.rating ?? "",
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Nunito-Bold',
                                                  color: ApkColors.greenColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              //color: Colors.amber,
                                              child: Text(
                                                item?.dateTime ?? "",
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Nunito-Bold',
                                                  color: Color(0XFF15C55D),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: ApkColors.greenColor,
                                            size: 20,
                                          ),
                                          Expanded(
                                            child: Container(
                                              //color: Colors.amber,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                item?.address ?? "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Nunito-Bold',
                                                  color: Color(0XFF15C55D),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Obx(() {
                                            controller.like.value;
                                            return IconButton(
                                                onPressed: () {
                                                  if (controller.selectedIndexes
                                                      .contains(index)) {
                                                    controller.selectedIndexes
                                                        .remove(index);
                                                    controller.clickOnLike(
                                                        item?.id ?? "0",
                                                        false,
                                                        index);
                                                    controller.likeIncrement();
                                                  } else {
                                                    controller.selectedIndexes
                                                        .add(index);
                                                    controller.clickOnLike(
                                                        item?.id ?? "0",
                                                        true,
                                                        index);

                                                    controller.likeIncrement();
                                                  }
                                                  //count++;
                                                },
                                                icon: item?.fav ?? false
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        color: ApkColors
                                                            .greenColor,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_border,
                                                        color: ApkColors
                                                            .greenColor,
                                                      )

                                                // the method which is called
                                                // when button is pressed
                                                );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : Shimmer.fromColors(
                        baseColor: const Color(0XFF24252A),
                        highlightColor: ApkColors.backgroundColor,
                        enabled: true,
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              // padding: EdgeInsets.symmetric(horizontal: 10),
                              itemBuilder: (BuildContext context, int index) {
                                return CommonWidget.commonShimmer(
                                    shimmerWidget: Container(
                                      height: 200.px,
                                      width: 260,
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: ApkColors.primaryColor,
                                        border: Border.all(
                                            color: ApkColors.greenColor,
                                            width: 1),
                                      ),
                                    ),
                                    itemCount: 6);
                              }),
                        )));
              }),
              CommonWidget.commonidendifire(
                  onPressed: () {
                    Get.snackbar("title", "message");
                  },
                  bgcolor: Colors.green.withOpacity(0.2),
                  marginc: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 15, top: 15),
                  text: 'Categories'),
              Obx(() {
                controller.count.value;
                return (controller.dashboardData?.result != null
                    ? SizedBox(
                        height: 250.px,
                        child: ListView.builder(
                            itemCount: controller
                                .dashboardData?.result?.categories?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = controller
                                  .dashboardData?.result?.categories?[index];
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 180.px,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0XFF24252A),
                                  ),
                                  child: Column(
                                    children: [
                                      CommonWidget.imageView(
                                          borderRadius:
                                              BorderRadius.circular(30.px),
                                          image: item?.image ?? '',
                                          width: double.infinity,
                                          height: 140.px),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              //color: Colors.amber,
                                              child: Text(
                                                item?.categoryName ?? "",
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Nunito-Bold',
                                                  color: Color(0XFF15C55D),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
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
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  return CommonWidget.commonShimmer(
                                      shimmerWidget: Container(
                                        height: 100.px,
                                        width: 180.px,
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: ApkColors.primaryColor,
                                          border: Border.all(
                                              color: ApkColors.greenColor,
                                              width: 1),
                                        ),
                                      ),
                                      itemCount: 6);
                                })),
                      ));
              }),
              // CommonWidget.commonidendifire(
              //     onPressed: () {
              //       Get.snackbar("title", "message");
              //     },
              //     bgcolor: Colors.green.withOpacity(0.2),
              //     marginc: const EdgeInsets.only(
              //         left: 10, right: 10, bottom: 15, top: 15),
              //     text: 'Restaurant'),
              // Obx(() {
              //   controller.count.value;
              //   return SizedBox(
              //       height: 350.px,
              //       child: (controller.dashboardData?.result != null
              //           ? ListView.builder(
              //               itemCount: controller
              //                   .dashboardData?.result?.restaurant?.length,
              //               scrollDirection: Axis.horizontal,
              //               itemBuilder: (context, index) {
              //                 final item = controller
              //                     .dashboardData?.result?.restaurant?[index];
              //                 return GestureDetector(
              //                   onTap: () {
              //
              //                     controller.clickOnItemRestaurant(0, index.toString(), "ok");
              //                   },
              //                   child: Container(
              //                     width: 180.px,
              //                     margin: const EdgeInsets.all(10),
              //                     padding: const EdgeInsets.all(20),
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(30),
              //                       color: const Color(0XFF24252A),
              //                     ),
              //                     child: Column(
              //                       children: [
              //                         CommonWidget.imageView(
              //                             borderRadius:
              //                                 BorderRadius.circular(30.px),
              //                             image: item?.images?.first.image ?? "",
              //                             width: double.infinity,
              //                             height: 140.px),
              //                         const SizedBox(
              //                           height: 10,
              //                         ),
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Expanded(
              //                               child: Text(
              //                                 item?.title ?? "",
              //                                 maxLines: 1,
              //                                 textAlign: TextAlign.start,
              //                                 overflow: TextOverflow.ellipsis,
              //                                 style: const TextStyle(
              //                                   fontSize: 16,
              //                                   fontWeight: FontWeight.w700,
              //                                   fontFamily: 'Nunito-Bold',
              //                                   color: Color(0XFF15C55D),
              //                                 ),
              //                               ),
              //                             ),
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 const Icon(
              //                                   Icons.star_rate_rounded,
              //                                   color: ApkColors.greenColor,
              //                                   size: 20,
              //                                 ),
              //                                 const SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   item?.rating ?? '',
              //                                   maxLines: 1,
              //                                   textAlign: TextAlign.center,
              //                                   overflow: TextOverflow.ellipsis,
              //                                   style: const TextStyle(
              //                                     fontSize: 12,
              //                                     fontWeight: FontWeight.w500,
              //                                     fontFamily: 'Nunito-Bold',
              //                                     color: ApkColors.greenColor,
              //                                   ),
              //                                 ),
              //                               ],
              //                             )
              //                           ],
              //                         ),
              //                         const SizedBox(
              //                           height: 10,
              //                         ),
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                           children: [
              //                             Expanded(
              //                               child: Text(
              //                                 item?.dateTime ?? "",
              //                                 maxLines: 1,
              //                                 textAlign: TextAlign.start,
              //                                 overflow: TextOverflow.ellipsis,
              //                                 style: const TextStyle(
              //                                   fontSize: 10,
              //                                   fontWeight: FontWeight.w700,
              //                                   fontFamily: 'Nunito-Bold',
              //                                   color: Color(0XFF15C55D),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                           children: [
              //                             const Icon(
              //                               Icons.location_on,
              //                               color: ApkColors.greenColor,
              //                               size: 20,
              //                             ),
              //                             Expanded(
              //                               child: Text(
              //                                 item?.address ?? "",
              //                                 maxLines: 1,
              //                                 overflow: TextOverflow.ellipsis,
              //                                 style: const TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.w700,
              //                                   fontFamily: 'Nunito-Bold',
              //                                   color: Color(0XFF15C55D),
              //                                 ),
              //                               ),
              //                             ),
              //                             IconButton(
              //                                 onPressed: () {
              //                                   if (controller.selectedIndexes
              //                                       .contains(index)) {
              //                                     controller.selectedIndexes
              //                                         .remove(index);
              //                                     controller.clickOnLike(
              //                                         item?.id ?? "0",
              //                                         false,
              //                                         index);
              //                                     controller.likeIncrement();
              //                                   } else {
              //                                     controller.selectedIndexes
              //                                         .add(index);
              //                                     controller.clickOnLike(
              //                                         item?.id ?? "0",
              //                                         true,
              //                                         index);
              //
              //                                     controller.likeIncrement();
              //                                   }
              //                                   //count++;
              //                                 },
              //                                 icon: item?.fav ?? false
              //                                     ? const Icon(
              //                                         Icons.favorite,
              //                                         color:
              //                                             ApkColors.greenColor,
              //                                       )
              //                                     : const Icon(
              //                                         Icons.favorite_border,
              //                                         color:
              //                                             ApkColors.greenColor,
              //                                       )
              //
              //                                 // the method which is called
              //                                 // when button is pressed
              //                                 )
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               })
              //           : const Center(child: Text("loadind"))));
              // }),
            ],
          ),
        ),
      );
    });
  }
}
