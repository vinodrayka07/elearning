import 'package:get/get.dart';

import '../controllers/my_event_page_controller.dart';

class MyEventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyEventPageController>(
      () => MyEventPageController(),
    );
  }
}
