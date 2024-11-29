import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/search_list_view_controller.dart';

class SearchListViewView extends GetView<SearchListViewController> {
  const SearchListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchListViewController());
    Get.lazyPut(() => SearchListViewController());
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Obx(() {
        controller.count.value;
        return GestureDetector(
          onTap: () {
           controller.unFocus();
           controller.increment();

          },
          child: Column(
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
                          child: GestureDetector(
                        onTap: () {
                          //controller.setFocus();
                          controller.increment();
                        },
                        child: Hero(
                          tag: "dashboard",
                          child: Material(
                            type: MaterialType.transparency,
                            child: Container(
                              height: Get.height * 0.054,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20, bottom: 20),
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ApkColors.backgroundColor,
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
                                focusNode: controller.focusNode,
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
                        ),
                      ))
                    ],
                  ),
                  height: 160),
              const SizedBox(
                height: 20,
              ),
              controller.isLoading!
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: CircularProgressIndicator(
                                color: ApkColors.greenColor)),
                      ],
                    )
                  : Obx(() {
                      controller.listValue.value;
                      return (controller.searchList != null &&
                              controller.searchList!.isNotEmpty)
                          ? Expanded(child:
                              GetBuilder<SearchListViewController>(
                                  builder: (context) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.only(
                                      left: 10.px, right: 10.px),
                                  itemCount: controller.searchList?.length,
                                  itemBuilder: (context, index) {
                                    var item = controller.searchList?[index];
                                    return GestureDetector(
                                      onTap: (){
                                        controller.clickOnItem(index,item?.id ?? "",item?.title ?? "");
                                        },
                                      child: Card(
                                        color: ApkColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.px)),
                                        margin: EdgeInsets.all(10.px),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(5.px),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              /* Container(
                                                            height: 130.px,
                                                            width: 115.px,
                                                            margin: EdgeInsets.only(right: 5.px),
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: controller
                                                                      .featuresColors[controller.getRandomNumber()],
                                                                  begin: const FractionalOffset(0, 0),
                                                                  end: const FractionalOffset(1, 1),
                                                                  tileMode: TileMode.clamp),
                                                              borderRadius: BorderRadius.circular(10.px),
                                                            ),
                                                          ),*/
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 5.px),
                                                child: CommonWidget.imageView(
                                                    image: item?.images! != null
                                                        ? 'https://server-php-8-2.technorizen.com/amuse/public/uploads/1726494135_8abe598ccb0a1ff980e7.jpg'
                                                        : 'https://server-php-8-2.technorizen.com/amuse/public/uploads/1726494135_8abe598ccb0a1ff980e7.jpg',
                                                    height: 130.px,
                                                    width: 115.px,
                                                    defaultNetworkImage:
                                                        "https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/Flutter.png?alt=media&token=3d8111c7-08da-4398-a546-f78212dbd2b0"),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      item?.title ?? '',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'Nunito-Bold',
                                                        color: ApkColors
                                                            .greenColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: 10.px,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          item?.dateTime
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                            fontSize: 11.px,
                                                            fontFamily:
                                                                'Nunito-Bold',
                                                            color: ApkColors
                                                                .greenColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        /*   SizedBox(
                                                                      width: 50.px,
                                                                      child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20.px,
                                                                                ),
                                                                                Text(
                                        item.rating ?? '4.0',
                                        style: MyTextStyle.titleStyle14bb,
                                                                                )
                                                                              ],
                                                                      ),
                                                                    ) */
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.px,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          color: ApkColors
                                                              .greenColor,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            item?.address ?? '',
                                                            style: TextStyle(
                                                              fontSize: 12.px,
                                                              fontFamily:
                                                                  'Nunito-Bold',
                                                              color: ApkColors
                                                                  .greenColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              //  controller.clickOnLike(index);
                                                            },
                                                            child: item?.fav ??
                                                                    false
                                                                ? Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: ApkColors
                                                                        .greenColor,
                                                                    size: 24.px,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: ApkColors
                                                                        .greenColor,
                                                                    size: 24.px,
                                                                  )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            })
                      )
                          : const Center(child: Text("No data"));
                    })
            ],
          ),
        );
      }),
    );
  }
}
