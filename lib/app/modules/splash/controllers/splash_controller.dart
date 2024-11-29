import 'package:elearner/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    splashDuration();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  splashDuration(){
    Future.delayed(Duration(seconds: 2),() async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      bool? isLogin=_prefs.getBool('isLogin');
      print("isLogin {$isLogin}");
      if( isLogin == null ){
        Get.offNamed(Routes.MAIN_ACTIVITY);
      } else if (isLogin){
        Get.offNamed(Routes.MAIN_ACTIVITY);
      }
      else{
        Get.offNamed(Routes.LOGIN_PAGE);
      }

    });

  }
}
