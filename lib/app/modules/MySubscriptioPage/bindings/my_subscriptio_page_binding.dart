import 'package:get/get.dart';

import '../controllers/my_subscriptio_page_controller.dart';

class MySubscriptioPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySubscriptioPageController>(
      () => MySubscriptioPageController(),
    );
  }
}
