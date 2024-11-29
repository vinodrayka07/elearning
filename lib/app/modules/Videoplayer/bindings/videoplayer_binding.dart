import 'package:get/get.dart';

import '../controllers/videoplayer_controller.dart';

class VideoplayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoplayerController>(
      () => VideoplayerController(),
    );
  }
}
