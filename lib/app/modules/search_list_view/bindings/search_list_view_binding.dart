import 'package:get/get.dart';

import '../controllers/search_list_view_controller.dart';

class SearchListViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchListViewController>(
      () => SearchListViewController(),
    );
  }
}
