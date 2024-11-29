import 'package:get/get.dart';

import '../controllers/data_viewpage_controller.dart';

class DataViewpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataViewpageController>(
      () => DataViewpageController(),
    );
  }
}
