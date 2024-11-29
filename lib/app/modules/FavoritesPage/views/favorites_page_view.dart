import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../controllers/favorites_page_controller.dart';

class FavoritesPageView extends GetView<FavoritesPageController> {
  const FavoritesPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesPageController());
    Get.lazyPut<FavoritesPageController>(
          () => FavoritesPageController(),
    );
    return Obx((){
      controller.count.value;
      return  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.px),
          child: Container(
            margin: EdgeInsets.only(top: 60.px, left: 20.px,right: 20.px,bottom: 10.px),
            child: Text(
              "Favorites",
              style: TextStyle(
                  fontFamily: 'Nunito-Bold',
                  fontWeight: FontWeight.w700,
                  color: ApkColors.greenColor,
                  fontSize: 28.px),
            ),
          ) ,

        ),
        body: Column(
          children: [
            Expanded(

                child: (controller.featuredModel?.result != null
                    ? GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.featuredModel?.result?.length,
                  physics: ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 290,
                  ),


                  itemBuilder: (context, index) {
                    final item =  controller.featuredModel?.result?[index];
                    return GestureDetector(
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
                                image: "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png",
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
                                      item?.title ?? "",
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
                                      item!.rating!,
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    // color: Colors.amber,
                                    child: Text(
                                      item!.dateTime!,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
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
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      item.address!,
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



                    );

                    //   ListTile(
                    //   title: Text(list?[index]['title']
                    //   ,
                    //   style: TextStyle(
                    //       fontSize: 10,
                    //       color: Color(0XFF15c55D),
                    //       fontFamily: 'Nunito-Bold',
                    //       fontWeight: FontWeight.bold
                    //   ),),
                    //   subtitle: Text(list?[index]['subtitle'],
                    //       style: TextStyle(
                    //       fontSize: 10,
                    //       color: Color(0XFF15c55D),
                    //       fontFamily: 'Nunito-Bold',
                    //       fontWeight: FontWeight.bold
                    //   ),),
                    // );
                  },
                )
                    : const Center(child: CircularProgressIndicator(
                  color: Color(0XFF15C55D),
                ),)
                )



              // Container(
              //   height: 300,
              //   margin: EdgeInsets.only(top: 50,left: 20,right: 20),
              //   padding: EdgeInsets.all(40),
              //   alignment: Alignment.center,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //    // color: Colors.red,
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(color: Colors.green,width: 5),
              //     gradient: const LinearGradient(
              //       begin: Alignment.center,
              //       end: Alignment.bottomRight,
              //         colors: [Colors.purple,Colors.blueAccent]
              //     )
              //   ),
              //   child:  Container(
              //     width: double.infinity,
              //     color: Colors.white,
              //     child: const Text("welcome to app ok",style: TextStyle(
              //       fontSize: 20,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //
              //
              //     )),
              //   ),
              // ),

            )
          ],
        )
      );
    });


  }
}
