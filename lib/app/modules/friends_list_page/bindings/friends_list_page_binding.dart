import 'package:get/get.dart';

import '../controllers/friends_list_page_controller.dart';

class FriendsListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendsListPageController>(
      () => FriendsListPageController(),
    );
  }
}
