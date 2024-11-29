import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchHistoryView extends GetView {
  const SearchHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    //controller.
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    // height: 30,
                    width: 80,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ApkColors.darkgreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        "clubbing",
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                            color: ApkColors.greenColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  // Container(
                  //   // height: 30,
                  //   width: 100,
                  //   alignment: Alignment.center,
                  //   //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: ApkColors.darkgreenColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //
                  //   child: InkWell(
                  //     onTap: () {},
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: Text(
                  //       "restaurant",
                  //       style: TextStyle(
                  //           fontFamily: 'Nunito-Bold',
                  //           fontWeight: FontWeight.bold,
                  //           color: ApkColors.greenColor,
                  //           fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   // height: 30,
                  //   width: 100,
                  //   alignment: Alignment.center,
                  //   //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: ApkColors.darkgreenColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //
                  //   child: InkWell(
                  //     onTap: () {},
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: Text(
                  //       "bar",
                  //       style: TextStyle(
                  //           fontFamily: 'Nunito-Bold',
                  //           fontWeight: FontWeight.bold,
                  //           color: ApkColors.greenColor,
                  //           fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   // height: 30,
                  //   width: 100,
                  //   alignment: Alignment.center,
                  //   //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: ApkColors.darkgreenColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //
                  //   child: InkWell(
                  //     onTap: () {},
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: Text(
                  //       "family",
                  //       style: TextStyle(
                  //           fontFamily: 'Nunito-Bold',
                  //           fontWeight: FontWeight.bold,
                  //           color: ApkColors.greenColor,
                  //           fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   // height: 30,
                  //   width: 100,
                  //   alignment: Alignment.center,
                  //   //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: ApkColors.darkgreenColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //
                  //   child: InkWell(
                  //     onTap: () {},
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: const Text(
                  //       "concert",
                  //       style: TextStyle(
                  //           fontFamily: 'Nunito-Bold',
                  //           fontWeight: FontWeight.bold,
                  //           color: ApkColors.greenColor,
                  //           fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   // height: 30,
                  //   width: 100,
                  //   alignment: Alignment.center,
                  //   //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: ApkColors.darkgreenColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //
                  //   child: InkWell(
                  //     onTap: () {},
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: const Text(
                  //       "culture",
                  //       style: TextStyle(
                  //           fontFamily: 'Nunito-Bold',
                  //           fontWeight: FontWeight.bold,
                  //           color: ApkColors.greenColor,
                  //           fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   // height: 30,
                  //   width: 100,
                  //   alignment: Alignment.center,
                  //   //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: ApkColors.darkgreenColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //
                  //   child: InkWell(
                  //     onTap: () {},
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: const Text(
                  //       "Categories",
                  //       style: TextStyle(
                  //           fontFamily: 'Nunito-Bold',
                  //           fontWeight: FontWeight.bold,
                  //           color: ApkColors.greenColor,
                  //           fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),


            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(
              height: 20.px,
            ),




            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    // height: 30,
                    width: 80,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ApkColors.darkgreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: const Text(
                        "Spring outing",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                            color: ApkColors.greenColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    // height: 30,
                    width: 100,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ApkColors.darkgreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        "Teddy",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                            color: ApkColors.greenColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    // height: 30,
                    width: 100,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ApkColors.darkgreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        "Toy",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                            color: ApkColors.greenColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    // height: 30,
                    width: 100,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ApkColors.darkgreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        "Show MOE",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                            color: ApkColors.greenColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    // height: 30,
                    width: 100,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ApkColors.darkgreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: const Text(
                        "Dogs don't like to eat",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontWeight: FontWeight.bold,
                            color: ApkColors.greenColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
