import 'package:get/get.dart';

import '../controllers/my_friends_page_controller.dart';

class MyFriendsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFriendsPageController>(
      () => MyFriendsPageController(),
    );
  }
}
