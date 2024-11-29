import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(ProfilePageController());
    Get.lazyPut<ProfilePageController>(
          () => ProfilePageController(),
    );
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(100.px),
        child: Container(
          margin: EdgeInsets.only(top: 80.px, left: 20.px,right: 20.px,bottom: 10.px),
          child: Text(
            "Profile",
            style: TextStyle(
                fontFamily: 'Nunito-Bold',
                fontWeight: FontWeight.w700,
                color: ApkColors.greenColor,
                fontSize: 28.px),
          ),
        ) ,

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.PROFILE_UPDATE_PAGE);
                },
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
                             controller.userModel?.result?.email ?? ".............",
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
                        Icon(Icons.arrow_forward_ios_outlined,size: 20.px,color: ApkColors.greenColor,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Get.toNamed(Routes.MY_EVENT_PAGE);
                },
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      size: 30.px,
                      Icons.light_mode
                    )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "My Event",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      size: 30.px,
                      Icons.password
                    )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Change Password",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
               onTap: (){
                 Get.toNamed(Routes.MY_FRIENDS_PAGE);
               },
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.person_pin
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "My Friends",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.translate_rounded
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Language",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.payment
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Payment",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.notifications_active
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.support_agent
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Support",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.info_outline
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "FAQ",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.info
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "About us",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.rule
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Terms and Condition",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.safety_check_rounded
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.logout
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ApkColors.primaryColor,
                  radius: 15.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                          size: 30.px,
                          Icons.delete
                      )
                  ),
                  //CircleAvatar
                ),
                title: Text(
                  "Delete Account",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontWeight: FontWeight.w800,
                      color: ApkColors.greenColor,
                      fontSize: 19.px),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20.px,),
              ),
            ),










            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     "Bio",
            //     style: TextStyle(
            //         fontFamily: 'Nunito-Bold',
            //         fontWeight: FontWeight.w800,
            //         color: ApkColors.greenColor,
            //         fontSize: 19.px),
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     "Lorem ipsum dolor sit amet consectetur. Lacus maecenas volutpat ipsum magna pharetra eu tellus. Vel vestibulum quis ut enim id dui amet diam arcu. Id convallis tincidunt amet ornare eget.",
            //     maxLines: 4,
            //     style: TextStyle(
            //         fontFamily: 'Nunito-Bold',
            //         fontWeight: FontWeight.w400,
            //         color: ApkColors.greenColor,
            //         fontSize: 14.px),
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            //   child: Text(
            //     "Event",
            //     maxLines: 4,
            //     style: TextStyle(
            //         fontFamily: 'Nunito-Bold',
            //         fontWeight: FontWeight.w800,
            //         color: ApkColors.greenColor,
            //         fontSize: 18.px),
            //   ),
            // ),
            // Expanded(
            //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty
            //         ? GridView.builder(
            //       scrollDirection: Axis.vertical,
            //       shrinkWrap: true,
            //       itemCount: CatalogModel.items.length,
            //       physics: ClampingScrollPhysics(),
            //       padding: const EdgeInsets.all(16),
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 8,
            //         crossAxisSpacing: 8,
            //         mainAxisExtent: 200,
            //       ),
            //
            //
            //       itemBuilder: (context, index) {
            //         final item = CatalogModel.items[index];
            //         return GestureDetector(
            //           child: Container(
            //
            //             margin: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               color: Color(0XFF24252A),
            //               borderRadius: BorderRadius.circular(20),
            //             ),
            //             child: Stack(
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const SizedBox(
            //                       height: 15,
            //                     ),
            //                     Center(
            //                       child: ClipRRect(
            //                         borderRadius: BorderRadius.circular(10),
            //                         child: Image.network(
            //                           item.image,
            //                           height: 100,
            //                           width: 100,
            //                           fit: BoxFit.fill,
            //                           loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            //                             if (loadingProgress == null) return child;
            //                             return const  Center(
            //                                 child: CircularProgressIndicator(
            //                                   color: Color(0XFF15c55D) ,
            //                                 )
            //                             );
            //                           },
            //                           errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            //                             return const Icon(Icons.error,
            //                               size: 100,
            //                               color: Colors.red,);
            //                           },
            //                         ),
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       height: 15,
            //                     ),
            //                     Container(
            //                       width: double.infinity,
            //                       //color:Colors.black,
            //                       padding: EdgeInsets.only(left: 40),
            //                       child: Text(
            //                         item.name,
            //                         // maxLines: 1,
            //                         textAlign: TextAlign.start,
            //                         overflow: TextOverflow.ellipsis,
            //                         style: const TextStyle(
            //                             fontFamily: 'Nunito-Bold',
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 12,
            //                             color: Color(0XFF15c55D)),
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       height: 4,
            //                     ),
            //                     Container(
            //                       //color: Colors.black,
            //                       padding: EdgeInsets.symmetric(horizontal: 40),
            //                       width: double.infinity,
            //                       child: Text(
            //                         item.desc,
            //                         maxLines: 1,
            //                         style: const TextStyle(
            //                             fontSize: 10,
            //                             color: Color(0XFF15c55D),
            //                             fontFamily: 'Nunito-Bold',
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Align(
            //                   alignment: Alignment.topRight,
            //
            //                   child: Material(
            //                     color: Color(0XFF24252A),
            //                     borderRadius: const BorderRadius.only(
            //                       topRight: Radius.circular(20),
            //                       bottomLeft: Radius.circular(20),
            //
            //                     ),
            //                     child: IconButton(
            //                       onPressed: () {
            //                         setState(
            //                               () {
            //                             if (selectedIndexes.contains(index)) {
            //                               selectedIndexes.remove(index);
            //                             } else {
            //                               selectedIndexes.add(index);
            //                             }
            //                             //count++;
            //                           },
            //                         );
            //                       },
            //                       icon: selectedIndexes.contains(index)
            //                           ?
            //                       const Icon(
            //                         Icons.favorite,
            //                         color: Colors.red,
            //
            //                       )
            //                           :
            //                       const Icon(
            //                         Icons.favorite_border,
            //                         color: Colors.red,
            //                       ),
            //                       // the method which is called
            //                       // when button is pressed
            //
            //                     ),
            //                   ),
            //                 ),
            //                 const Align(
            //                   alignment: Alignment.bottomLeft,
            //                   child: Material(
            //                     color: Color(0XFF15C55D),
            //                     borderRadius: BorderRadius.only(
            //                       topRight: Radius.circular(20),
            //                       bottomLeft: Radius.circular(20),
            //                     ),
            //                     child: InkWell(
            //                       child: Padding(
            //                         padding: EdgeInsets.all(5),
            //                         child: Icon(
            //                             Icons.location_on,
            //                             color: Color(0XFF24252A)
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         );
            //
            //         //   ListTile(
            //         //   title: Text(list?[index]['title']
            //         //   ,
            //         //   style: TextStyle(
            //         //       fontSize: 10,
            //         //       color: Color(0XFF15c55D),
            //         //       fontFamily: 'Nunito-Bold',
            //         //       fontWeight: FontWeight.bold
            //         //   ),),
            //         //   subtitle: Text(list?[index]['subtitle'],
            //         //       style: TextStyle(
            //         //       fontSize: 10,
            //         //       color: Color(0XFF15c55D),
            //         //       fontFamily: 'Nunito-Bold',
            //         //       fontWeight: FontWeight.bold
            //         //   ),),
            //         // );
            //       },
            //     )
            //         : const Center(child: CircularProgressIndicator(
            //       color: Color(0XFF15C55D),
            //
            //     ),)
            //     )
            //
            //
            //
            //   // Container(
            //   //   height: 300,
            //   //   margin: EdgeInsets.only(top: 50,left: 20,right: 20),
            //   //   padding: EdgeInsets.all(40),
            //   //   alignment: Alignment.center,
            //   //   width: double.infinity,
            //   //   decoration: BoxDecoration(
            //   //    // color: Colors.red,
            //   //     borderRadius: BorderRadius.circular(20),
            //   //     border: Border.all(color: Colors.green,width: 5),
            //   //     gradient: const LinearGradient(
            //   //       begin: Alignment.center,
            //   //       end: Alignment.bottomRight,
            //   //         colors: [Colors.purple,Colors.blueAccent]
            //   //     )
            //   //   ),
            //   //   child:  Container(
            //   //     width: double.infinity,
            //   //     color: Colors.white,
            //   //     child: const Text("welcome to app ok",style: TextStyle(
            //   //       fontSize: 20,
            //   //       color: Colors.black,
            //   //       fontWeight: FontWeight.bold,
            //   //
            //   //
            //   //     )),
            //   //   ),
            //   // ),
            //
            // )
          ],
        ),
      ),
    );
  }
}
