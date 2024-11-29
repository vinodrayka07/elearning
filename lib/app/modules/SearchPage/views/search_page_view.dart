import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../search_list_view/views/search_list_view_view.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(SearchPageController());
    Get.lazyPut(()=>SearchPageController());
    return Scaffold(
      backgroundColor: ApkColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidget.topbargredient(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5, top: 5),
                    decoration: BoxDecoration(
                        color: ApkColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: 40,
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
                  Expanded(
                    child: CommonWidget.commonSearchView(
                        onPressed: () {
                          Get.to(() => const SearchListViewView(),
                              fullscreenDialog: true,
                              popGesture: true,
                              transition: Transition.fade,
                              duration: const Duration(seconds: 0));
                        },
                        tag: "dashboard123",
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        bgcolor: ApkColors.backgroundColor),
                  )
                ],
              ),
              height: 160),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Top Categories 🔥",
              style: TextStyle(
                  fontSize: 17.px,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito-Bold',
                  color: ApkColors.greenColor),
            ),
          ),
          SizedBox(
            height: 20.px,
          ),
          Obx(() {
            controller.count.value;
            return controller.dashboardData != null
                ? LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (int i = 0;
                      i < controller.categoriesData!.length;
                      i++)
                        Container(
                          //height: height,
                          width: 80.px,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ApkColors.darkgreenColor,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Text(
                              controller
                                  .categoriesData![i].categoryName!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontWeight: FontWeight.bold,
                                  color: ApkColors.greenColor,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            )
                : Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Shimmer.fromColors(
                      baseColor: ApkColors.primaryColor,
                      highlightColor: ApkColors.greenColor,
                      enabled: true,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          // padding:
                          // const EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder:
                              (BuildContext context, int index) {
                            return CommonWidget.commonShimmer(
                                shimmerWidget: Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 30),
                                  decoration: BoxDecoration(
                                    color: ApkColors.darkgreenColor,
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                ),
                                itemCount: 6);
                          })),
                ),
                SizedBox(
                  height: 50,
                  child: Shimmer.fromColors(
                      baseColor: ApkColors.primaryColor,
                      highlightColor: ApkColors.greenColor,
                      enabled: true,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          // padding:
                          // const EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder:
                              (BuildContext context, int index) {
                            return CommonWidget.commonShimmer(
                                shimmerWidget: Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 30),
                                  decoration: BoxDecoration(
                                    color: ApkColors.darkgreenColor,
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                ),
                                itemCount: 6);
                          })),
                ),
              ],
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Search history  🔍",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17.px,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito-Bold',
                      color: ApkColors.greenColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.deleteHistoryData(
                      controller
                          .searchHistoryData![0].name,
                      controller.searchHistoryData![0]
                          .eventId,0);
                },
                icon: const Icon(
                  CupertinoIcons.delete,
                  color: ApkColors.greenColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.px,
          ),
          // controller.searchHistory?.result?.length == null
          //     ? const Center(
          //   child: Text("No data"),
          // )
              //:
          Obx(() {
            controller.count.value;
            return controller.searchHistory != null
                ? LayoutBuilder(
              builder: (context, constraints) {
                // final width = constraints.minWidth;
                //final height = constraints.minHeight;

                return SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (int i = 0;
                      i <
                          controller
                              .searchHistoryData!.length;
                      i++)
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            //height: height,
                              width: 100.px,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ApkColors.darkgreenColor,
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller
                                          .searchHistoryData![i]
                                          .name!,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily:
                                          'Nunito-Bold',
                                          fontWeight:
                                          FontWeight.bold,
                                          color: ApkColors
                                              .greenColor,
                                          fontSize: 10),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                    ],
                  ),
                );
              },
            )
                : Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Shimmer.fromColors(
                      baseColor: ApkColors.primaryColor,
                      highlightColor: ApkColors.greenColor,
                      enabled: true,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          // padding:
                          // const EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder:
                              (BuildContext context, int index) {
                            return CommonWidget.commonShimmer(
                                shimmerWidget: Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: 30),
                                  decoration: BoxDecoration(
                                    color:
                                    ApkColors.darkgreenColor,
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                ),
                                itemCount: 6);
                          })),
                ),
                SizedBox(
                  height: 50,
                  child: Shimmer.fromColors(
                      baseColor: ApkColors.primaryColor,
                      highlightColor: ApkColors.greenColor,
                      enabled: true,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          // padding:
                          // const EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder:
                              (BuildContext context, int index) {
                            return CommonWidget.commonShimmer(
                                shimmerWidget: Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: 30),
                                  decoration: BoxDecoration(
                                    color:
                                    ApkColors.darkgreenColor,
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                ),
                                itemCount: 6);
                          })),
                ),
              ],
            );
          })
        ],
      )
    );
  }
}
