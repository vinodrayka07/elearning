import 'package:get/get.dart';

import '../controllers/profile_update_page_controller.dart';

class ProfileUpdatePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdatePageController>(
      () => ProfileUpdatePageController(),
    );
  }
}
