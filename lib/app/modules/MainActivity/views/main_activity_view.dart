import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../AddEventPage/views/add_event_page_view.dart';
import '../../FavoritesPage/views/favorites_page_view.dart';
import '../../SearchPage/views/search_page_view.dart';
import '../../dashboard_page/views/dashboard_page_view.dart';
import '../../profile_page/views/profile_page_view.dart';
import '../../search_list_view/views/search_list_view_view.dart';
import '../controllers/main_activity_controller.dart';

class MainActivityView extends GetView<MainActivityController> {
  const MainActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.count.value;
    return Scaffold(
      bottomNavigationBar: Obx(() {
        controller.count.value;
        return SizedBox(
          height: 120.px,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.handleIndexChanged,
            currentIndex: controller.selectedPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ApkColors.backgroundColor,
            unselectedItemColor: Color(0X9015C55D),
            selectedItemColor: ApkColors.greenColor,
            // unselectedLabelStyle: unselectedLabelStyle,
            // selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: ApkColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: ApkColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: ApkColors.greenColor,
                  radius: 25.px,
                  child: CircleAvatar(
                    backgroundColor: ApkColors.primaryColor,
                    radius: 20.px,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            alignment: Alignment.center,
                            color: ApkColors.primaryColor,
                            height: 40.px,
                            width: 40.px,
                            child: Icon(
                              CupertinoIcons.add,
                              color: ApkColors.greenColor,
                            ))),
                    //CircleAvatar
                  ),
                ), //CircleAvatar
                label: '',
                backgroundColor: ApkColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    CupertinoIcons.heart,
                    size: 20.0,
                  ),
                ),
                label: 'Favorites',
                backgroundColor: ApkColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    CupertinoIcons.profile_circled,
                    size: 20.0,
                  ),
                ),
                label: 'Profile',
                backgroundColor: ApkColors.backgroundColor,
              ),
            ],
          ),
        );
      }),
      body: Obx(() {
        controller.count.value;
        return IndexedStack(
          index: controller.selectedPage,
          children: const [
            DashboardPageView(),
            SearchListViewView(),
            AddEventPageView(),
            FavoritesPageView(),
            ProfilePageView(),
          ],
        );
      }),
    );
  }
}
