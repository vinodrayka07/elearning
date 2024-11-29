import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DataViewpageController extends GetxController {
  //TODO: Implement DataViewpageController\
  final data = Get.arguments;

  final count = 0.obs;
  DatabaseReference? databaseRef;
  final listvelue = 0.obs;

  @override
  void onInit() {
    databaseRef = FirebaseDatabase.instance.ref('$data');
    listvelueLoad();

    super.onInit();
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
  void listvelueLoad() => listvelue.value++;
}
