import 'package:get/get.dart';

import '../controllers/edit_event_page_controller.dart';

class EditEventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEventPageController>(
      () => EditEventPageController(),
    );
  }
}
