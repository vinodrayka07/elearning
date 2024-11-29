import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../../Models/get_event_details.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';
import '../../../routes/app_pages.dart';


class EventDetailsPageController extends GetxController {
  Map<String, String?> data = Get.parameters;
  bool dataBool = false;

  Position? position;
  bool? isLoading;
  GetEventDetails? getEventDetails;
  final nuldata = null;

  List<String> image = [] ;
  List<String> images = ["https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_24096.png",];

  RxBool isBtnLoading = false.obs;
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try requesting permissions again
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      print('Location permissions are permanently denied.');
      return;
    }

    // When permission is granted, you can access the location
   position = await Geolocator.getCurrentPosition();
    print('Location: ${position?.latitude ?? "dsxs"}, ${position?.longitude ?? "dddd"}');
  }
    static LatLng latidue = LatLng(37.42796133580664, -122.085749655962) ;




  final Completer<GoogleMapController> mapcontroller =
  Completer<GoogleMapController>();

   String? mapStyleString;

  // final  CameraPosition kGooglePlex =  CameraPosition(
  //   target:LatLng(getEventDetails?.result?.lat as double,getEventDetails?.result?.long as double)  ?? LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  static  CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: latidue,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await mapcontroller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }



  final count = 0.obs;



  @override
  void onInit() {
    if(Get.arguments != null){
      dataBool = Get.arguments;
    }
    getEventData();
    checkLocationPermission();
    latidue = LatLng(position?.longitude ?? 37.43296265331129, position?.longitude ?? -122.085749655962);
    rootBundle.loadString("assets/animationfile/uber_maps_style.json").then((string) {
      mapStyleString  = string;
    });
    //goToTheLake();
   // print(mapStyleString);
    increment();
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


  getEventData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      //showLoading = true;
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
        ApiKeyConstants.eventId: data[ApiKeyConstants.eventId] ?? "",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          getEventDetails = await ApiMethods.getEventDetail(bodyParams: bodyParams);
          if (getEventDetails != null && getEventDetails?.status != '0') {
            isLoading = false;


            //  if(getEventDetails?.result?.favUsers != "[]" &&  getEventDetails?.result?.favUsers != null)
            //  {
            //
            //    getEventDetails?.result!.favUsers!.forEach((var num)=>
            //        image = num.image as List<String>
            //    );
            //
            // } else{
            //   image = images;
            // }

           // print("image data : ${image}");


            // data = {
            //   ApiKeyConstants.categoryName: ,
            // };


            // print("data is of result : ${item!.status!}");
            // print("data is of result : ${item.categoryName!}");
            increment();
            // Get.toNamed(Routes.OTP_PAGE, parameters: data);
          } else {
            Get.snackbar("Error", getEventDetails!.message ?? '');
            //CommonWidget.showErrorToastMessage(simpleResponseModel!.message ?? '');
            // sendshowSuccessToastMessage(simpleResponseModel!.message ?? "", this as BuildContext);
          }
          // showLoading = false;
          isLoading = false;
          //Get.snackbar(" ", "data ${dashboardData?.result}");
        }
      } catch (e) {
        // showLoading = false;
        isLoading = false;
        // CommonWidget.showWarningToastMessage('Enter unique email and phone number...');
        Get.snackbar("please", e.toString());
        print("catch data: ${e.toString()} ");
      }
    } else {
      isLoading = false;
      //CommonWidget.showWarningToastMessage(Stringconstants.allFieldsRequired);
      Get.snackbar(" ", Stringconstants.allFieldsRequired);
    }
  }


  Future<void> openMap(double latitude, double longitude) async {
    String mapUrl = '';
    if (Platform.isIOS) {
      mapUrl =
      'https://maps.apple.com/?daddr=$latitude,$longitude';
    } else {
      mapUrl =
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&travelmode=driving';
    }

    if (await canLaunchUrl(Uri.parse(mapUrl))) {
      await launchUrl(Uri.parse(mapUrl),mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }


  Future<void> clickOnItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> bodyParams = {
      ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      ApiKeyConstants.eventId: data[ApiKeyConstants.eventId] ?? "",
    };
    Get.toNamed(Routes.EDIT_EVENT_PAGE,parameters: bodyParams);


  }

  void increment() => count.value++;



}
