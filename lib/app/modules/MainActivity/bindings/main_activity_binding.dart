import 'package:get/get.dart';

import '../controllers/main_activity_controller.dart';

class MainActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainActivityController>(
      () => MainActivityController(),
    );
  }
}
