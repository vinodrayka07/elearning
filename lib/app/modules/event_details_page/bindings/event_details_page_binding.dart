import 'package:get/get.dart';

import '../controllers/event_details_page_controller.dart';

class EventDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailsPageController>(
      () => EventDetailsPageController(),
    );
  }
}
