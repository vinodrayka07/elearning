import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/featured_model.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class FavoritesPageController extends GetxController {
  //TODO: Implement FavoritesPageController

  final count = 0.obs;
  bool isLoading = true;
  FeaturedModel? featuredModel;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getFavData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  getFavData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          featuredModel = await ApiMethods.getFavoritesList(bodyParams: bodyParams);
          if (featuredModel != null && featuredModel?.status != '0') {
            isLoading = false;
            var item =featuredModel?.result;
            print("ressultee: ${item} ");


            increment();


          } else {
            Get.snackbar("Error", featuredModel!.message ?? '');
          }

          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        Get.snackbar("please favorites..", e.toString());
        print("catch data: ${e.toString()} ");
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  void increment() => count.value++;
}
