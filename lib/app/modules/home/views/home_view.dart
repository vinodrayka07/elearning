import 'package:elearner/CommonFile/CommonWidget.dart';
import 'package:elearner/LIstviews/CommonListViews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../colors/ApkColors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    return Obx((){
      controller.count.value;
      return Scaffold(
          backgroundColor: ApkColors.backgroundColor,
          key: controller.scaffoldKey,
          extendBody: true,
          drawer: Drawer(
              backgroundColor: ApkColors.backgroundColor,

              child: Stack(
                children: [
                  Image.asset('assets/images/drawerbg.png'),
                  SizedBox(
                    height: Get.height*0.2,
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width*0.01,
                        ),
                        Container(
                          child: GestureDetector(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/elearnerlogo.png',
                                  height: Get.height*0.05,
                                  width: Get.width*0.05,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: Get.width*0.01,
                        ),
                        SizedBox(
                          height: Get.height*0.07,

                          //color: Colors.cyan,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome...",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.bold,
                                    color: ApkColors.backgroundColor,
                                    fontSize: 16),
                              ),
                              Text(
                                "to user..",
                                style: TextStyle(
                                    fontFamily: 'Nunito-Bold',
                                    fontWeight: FontWeight.bold,
                                    color: ApkColors.backgroundColor,
                                    fontSize: 12),
                              )
                            ],
                          ),

                          // child:
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.cyan,
                    margin: const EdgeInsets.only(top: 300),
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        ListTile(
                          leading:
                          const Icon(Icons.home, color: ApkColors.greenColor),
                          title: const Text(
                            'Home',
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color: ApkColors.greenColor,
                                fontSize: 12),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.picture_as_pdf,
                              color: ApkColors.greenColor),
                          title: const Text(
                            'Book Pdf',
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color: ApkColors.greenColor,
                                fontSize: 12),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading:
                          const Icon(Icons.quiz, color: ApkColors.greenColor),
                          title: const Text(
                            'Quize Test',
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color: ApkColors.greenColor,
                                fontSize: 12),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings,
                              color: ApkColors.greenColor),
                          title: const Text(
                            'Settings',
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color: ApkColors.greenColor,
                                fontSize: 12),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.health_and_safety_rounded,
                              color: ApkColors.greenColor),
                          title: const Text(
                            'Privacy and security',
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color: ApkColors.greenColor,
                                fontSize: 12),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            controller.dataupload();
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          appBar: PreferredSize(
            //preferredSize:  Size.fromHeight(80.0)
            preferredSize: const Size.fromHeight(200),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0XFF16171B), Color(0XFF24252A)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(
                              'assets/images/menuicon.png',
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () {
                              controller.openDrawer();
                            },
                          ),
                          const Spacer(),
                          Container(
                            //margin: EdgeInsets.only(left: 50),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ApkColors.primaryColor,
                                border: Border.all(
                                    color: ApkColors.greenColor, width: 0.5),
                                //color: Colors.cyan,
                              ),
                              padding: EdgeInsets.all(0.5),
                              alignment: Alignment.center,
                              child: const Icon(Icons.account_circle,
                                  color: ApkColors.greenColor))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30),
                    child: const Text(
                      "Hi vinod rayka...",
                      style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontWeight: FontWeight.bold,
                          color: ApkColors.greenColor,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidget.commonSearchView(
                      onPressed: () {
                        Get.offNamed(Routes.DASHBOARD_PAGE);
                      },bgcolor: ApkColors.backgroundColor),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              CommonWidget.commonidendifire(onPressed:(){
                Get.snackbar("title", "message");
              },bgcolor: Colors.green.withOpacity(0.2)),
              Common_listviews.categorySelection(mydatabaseRef: controller.databaseRef,
              ),
              CommonWidget.commonidendifire(onPressed:(){
                Get.snackbar("title", "message");
              },bgcolor: Colors.green.withOpacity(0.2),
                  text: 'OpeningCourse'),
              Common_listviews.openingSelection(dataiscome: true),
              CommonWidget.commonidendifire(onPressed:(){
                Get.snackbar("title", "message");
              },bgcolor: Colors.green.withOpacity(0.2),
                  text: 'Recommended'),
              Common_listviews.RecommendedCourceSelection(dataiscome: true),
              CommonWidget.commonidendifire(onPressed:(){
                Get.snackbar("title", "message");
              },bgcolor: Colors.green.withOpacity(0.2),
                  text: 'Recommended'),
              CommonWidget.commonidendifire(onPressed:(){
                Get.snackbar("title", "message");
              },bgcolor: Colors.green.withOpacity(0.2),
                  text: 'Recommended'),
              const SizedBox(
                height: 20,
              ),
            ]),
          )

      );
    });




  }
}
