import 'package:elearner/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/my_event_page_controller.dart';

class MyEventPageView extends GetView<MyEventPageController> {
  const MyEventPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.appBar(
            context: context,
            title: "My Event",
            styleText: TextStyle(
                fontFamily: 'Nunito-Bold',
                fontWeight: FontWeight.w700,
                color: ApkColors.greenColor,
                fontSize: 22.px)),
        body: Obx(() {
          controller.count.value;
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        // controller.setFocus();
                        controller.increment();
                      },
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          height: Get.height * 0.054,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ApkColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            // border: Border.all(color:ApkColors.greenColor,
                            //   width: 0.5),
                          ),
                          child: TextField(
                            textAlign: TextAlign.start,
                            cursorColor: ApkColors.greenColor,
                            onTap: () {},
                            autofocus: false,
                            onChanged: (value) {
                               controller.searchRecipes(value);
                            },
                            //focusNode: controller.focusNode,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nunito-Bold',
                              color: ApkColors.greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: ApkColors.greenColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    Get.snackbar("title", "hhj");
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: ApkColors.greenColor,
                                  ),
                                ),
                                hintText: "Search here events...",
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Nunito-Bold',
                                  color: ApkColors.greenColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
                controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: ApkColors.greenColor,
                        ),
                      )
                    : (controller.featuredModel?.result != null &&
                            controller.featuredModel?.status != '0'
                        ? GetBuilder<MyEventPageController>(builder: (context) {
                            return GridView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:
                                  controller.searchList?.length,
                              physics: ClampingScrollPhysics(),
                              padding: const EdgeInsets.all(16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 290,
                              ),
                              itemBuilder: (context, index) {
                                final item = controller.searchList?[index];
                                return GestureDetector(
                                  onTap: (){
                                    controller.clickOnItem(index);
                                  },
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
                                            image: item!.images!.first.image!,
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
                                                  item.title ?? "",
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito-Bold',
                                                    color: Color(0XFF15C55D),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  item.rating!,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                // color: Colors.amber,
                                                child: Text(
                                                  item.dateTime!,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito-Bold',
                                                    color: Color(0XFF15C55D),
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
                                                // color: Colors.amber,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  item.address!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito-Bold',
                                                    color: Color(0XFF15C55D),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  //  controller.clickOnLike(index);
                                                },
                                                child: item.fav ?? false
                                                    ? Icon(
                                                        Icons.favorite,
                                                        color: ApkColors
                                                            .greenColor,
                                                        size: 24.px,
                                                      )
                                                    : Icon(
                                                        Icons.favorite_border,
                                                        color: ApkColors
                                                            .greenColor,
                                                        size: 24.px,
                                                      )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          })
                        : const Center(
                            child: Text("No data"),
                          ))
              ],
            ),
          );
        }));
  }
}
