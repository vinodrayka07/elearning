import 'package:get/get.dart';

import '../controllers/add_friends_page_controller.dart';

class AddFriendsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFriendsPageController>(
      () => AddFriendsPageController(),
    );
  }
}
