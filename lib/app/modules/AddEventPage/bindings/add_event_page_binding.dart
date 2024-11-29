import 'package:get/get.dart';

import '../controllers/add_event_page_controller.dart';

class AddEventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEventPageController>(
      () => AddEventPageController(),
    );
  }
}
