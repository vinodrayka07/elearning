import 'package:elearner/app/modules/profile_page/views/profile_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../SearchPage/views/search_page_view.dart';
import '../../Videoplayer/controllers/videoplayer_controller.dart';
import '../../dataViewpage/views/data_viewpage_view.dart';
import '../../home/views/home_view.dart';

class MainActivityController extends GetxController {
  //TODO: Implement MainActivityController

  final count = 0.obs;
  int indexCategory = 1;
  int selectedPage = 0;

  final pageOptions = [
    DataViewpageView(),
    VideoplayerController(),
    HomeView(),
    SearchPageView(),
    ProfilePageView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void handleIndexChanged(int i) {

      selectedPage = i;
      debugPrintStack(label: i.toString());
     increment();

  }

  void increment() => count.value++;
}
