import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../../CommonFile/image_pick_and_crop.dart';
import '../../../../Models/get_categories.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/Api_Models/SimpleResponseModel.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class AddEventPageController extends GetxController {
  //TODO: Implement AddEventPageController

  var formKey = GlobalKey<FormState>();
  RxBool isBtnLoading = false.obs;
  bool isLoading = true;
  GetCategory? dashboardData;
  bool borderColor = false;

  final count = 0.obs;
  TextEditingController eventText = TextEditingController();
  TextEditingController aboutText = TextEditingController();
  TextEditingController locationText = TextEditingController();
  TextEditingController dateRangeText = TextEditingController();
  TextEditingController visibleDateText = TextEditingController();
  final TextEditingController controllerSearch = TextEditingController();
  TextEditingController timeText = TextEditingController();
  bool dateColor = true;
  bool timeColor = true;
  bool pickedDate = false;
  bool pickedVisible = true;
  bool pickTime = false;
  bool condition = true;
  bool errorImage = true;
  double? lat;
  double? long;
  String? mapStyleString;
  Position? position;
  File? image;
  bool onClickIcon = false;
  List<File?> imageList = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];
  final List<String> itemsOfRecurring = [
    'daily',
    'weekly',
    'monthly',
    'two-thirds days',
    'only one day',
  ];
  DateTime? startDate;
  DateTime? endDate;
  String? timeDate;
  String? address;
  String autocompletePlace = "null";
  Prediction? initialValue;

 // var time;
  DateTime? picked;
  TimeOfDay? pickedTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String? selectedValue;
  String? selectedValueRecurring;
  final TextEditingController searchDropDownController =
      TextEditingController();
  final TextEditingController searchRecurringDropDownController =
      TextEditingController();
  List<String?> items = [];

  static const _apiKey = "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA";
  late LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);

  final Completer<GoogleMapController> mapcontroller =
      Completer<GoogleMapController>();

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
    
    // -------------------- //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //       ///||||\\\
    //      /// |||| \\\\
    //    ///// |||| \\\\\  --------[[[[[[[
    //  /////// ||||  \\\\\\ vinod rayka
    // ///////  ||||   \\\\\\
    // \\\\\\   ||||   //////
    //  \\\\\\  ||||  //////
    //    \\\\\ |||| //////
    //     \\\\ |||| ////  ------[[[[[[[[[[[
    //       \\\||||///
    //        \\\\////
    //         \\\///
    //          \\//
    //           \/
    //
    // -------------------- //
    

    // When permission is granted, you can access the location
    position = await Geolocator.getCurrentPosition();
    print(
        'Location: ${position?.latitude ?? "dsxs"}, ${position?.longitude ?? "dddd"}');
  }

  static LatLng latidue = LatLng(37.42796133580664, -122.085749655962);

  @override
  void onInit() {
    checkLocationPermission();
    rootBundle
        .loadString("assets/animationfile/uber_maps_style.json")
        .then((string) {
      mapStyleString = string;
      getCategoryData();
      increment();
    });

    DateTime tempDate = DateFormat.Hms().parse(selectedTime.hour.toString() +
        ":" +
        selectedTime.minute.toString() +
        ":" +
        '0' +
        ":" +
        '0');

    timeDate =
        "${DateFormat("dd/MM/yyyy").format(selectedDate)} ${DateFormat("hh:mm").format(tempDate)}";
    print(timeDate);
    print(pickTime);
    print(pickedDate);

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

  Future<void> checkPhotos() async {
    List<File> fileList = [];
    for (var element in imageList) {
      if (element != null) {
        fileList.add(element);
      }
    }
    print("first data of file : ${fileList.first}");
  }

  // double vvvv(){
  //    if(address != null){
  //      const _apiKey = 'YOUR_MAP_API_KEY';
  //      final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
  //      final address = await geocoder.findAddressesFromQuery('kochi,kerala');;
  //      print(address.first.coordinates);
  //
  //    }
  //    return 1.1;
  //
  // }

  getCategoryData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          dashboardData = await ApiMethods.categoryApi();
          if (dashboardData != null && dashboardData?.status != '0') {
            isLoading = false;
            print(
                "data is loading : ${dashboardData?.result![0].categoryName}");
            for (int i = 0; i < dashboardData!.result!.length; i++) {
              final itemsdata = dashboardData!.result?[i].categoryName;
              print(items);
              items.add(itemsdata);
            }

            // print(categoriesData?.length);
            increment();
          } else {
            Get.snackbar("Error", dashboardData!.message ?? '');
          }
          isLoading = false;
        }
      } catch (e) {
        isLoading = false;
        print(e);
        Get.snackbar("please", '$e');
      }
    } else {
      isLoading = false;
      Get.snackbar(" ", Stringconstants.noInternet);
    }
  }

  Future<void> getLatLang(String? getAddress) async {
    try {
      final address = await geocoder
          .findAddressesFromQuery(getAddress ?? "indore,Madhya Pradesh");
      var message = address.first.coordinates.toString();
      long = address.first.coordinates.longitude;
      lat = address.first.coordinates.latitude;
      log(message);
      // lat = address.first.coordinates.latitude!;
      // long = address.first.coordinates.longitude!;
      // ScaffoldMessenger.of(Get.context!).showSnackBar(
      //   SnackBar(
      //     content: Text(message),
      //   ),
      // );
    } catch (e) {
      log(e.toString());
      // ScaffoldMessenger.of(Get.context!).showSnackBar(
      //   const SnackBar(
      //     content: Text('SOMETING WENT WRONG\nDID YOU ADD API KEY '),
      //   ),
      // );
      rethrow;
    }
  }

  Future<void> getAddress() async {
    try {
      final address = await geocoder
          .findAddressesFromCoordinates(Coordinates(17.6652044, 53.9878829));
      var message = address.first.addressLine;
      if (message == null) return;
      log(message);
      print("Full Address addressLine ${message}");
      print("Full Address adminArea ${await address.first.adminArea}");
      print("Full Address postalCode ${await address.first.postalCode}");
      print("Full Address locality ${await address.first.locality}");
      print("Full Address featureName ${await address.first.featureName}");
      // print("Full Address ${address.first.countryName}");
      print("Full Address subAdminArea ${await address.first.subAdminArea}");
      // print("Full Address ${address.first.subThoroughfare}");
      //log(postal!);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } catch (e) {
      print("eeeeeeeeee......${e.toString()}");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('SOMETING WENT WRONG\nDID YOU ADD API KEY '),
        ),
      );
      rethrow;
    }
  }

  Future<void> clickGalleryTextButtonView(
      {required BuildContext context, required int index}) async {
    pickGallery(context: context, index: index);
    // Navigator.pop(context);
  }

  Future<void> pickGallery(
      {required BuildContext context, required int index}) async {
    image = await ImagePickerAndCropper.pickImage(
        context: context,
        wantCropper: true,
        color: Theme.of(context).primaryColor,
        pickImageFromGallery: true);
    imageList[index] = image;
    print(image?.path);
    increment();
  }

  FormFieldValidator<String>? eventTextValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("Event Name is required");
    } else
      return null;
  };


  FormFieldValidator<String>? locationTextValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("Location is required");
    } else
      return null;
  };
  FormFieldValidator<String>? aboutTextValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("About text is required");
    } else
      return null;
  };
  FormFieldValidator<String>? dateRangeTextValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("Date range is required");
    } else
      return null;
  };
  FormFieldValidator<String>? visibleDateTextValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("visible date is required");
    } else
      return null;
  };
  FormFieldValidator<String>? timeTextValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("Time is required");
    } else
      return null;
  };

  Future<void> selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked!;
      pickedVisible = true;
      dateColor = true;
      print("PickedDate$pickedVisible");
      visibleDateText = TextEditingController(
        text: pickedVisible //ternary expression to check if date is null
            ? "${ DateFormat('dd/MM/yyyy').format(selectedDate)}"
            : 'Visible Date!',
      );
      increment();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime = pickedTime!;
      pickTime = true;
      timeColor = true;
      print("PickTime $pickTime");
      print("PickedTime $pickedTime");

      timeText = TextEditingController(
        text: pickTime
            ? pickedTime != null
                ? formatedTime(pickedTime!)
                : 'Time Of Event!'
            : 'Time Of Event!',
      );
      //print("PickedTime $timeColor");
      increment();
    }
  }

  String formatedTime(TimeOfDay selectedTime) {
    DateTime tempDate = DateFormat.Hms().parse(selectedTime.hour.toString() +
        ":" +
        selectedTime.minute.toString() +
        ":" +
        '0' +
        ":" +
        '0');
    var dateFormat = DateFormat("h:mm a");
    return (dateFormat.format(tempDate));
  }

  String formatedTwoTime(TimeOfDay selectedTime) {
    DateTime tempDate = DateFormat.Hms().parse(selectedTime.hour.toString() +
        ":" +
        selectedTime.minute.toString() +
        ":" +
        '0' +
        ":" +
        '0');
    var dateFormat = DateFormat("HH:mm");
    return (dateFormat.format(tempDate));
  }

  Future<void> postAddApi() async {
    List<File> fileList = [];
    imageList.forEach((element) {
      if (element != null) {
        fileList.add(element);
      }
    });
    if (fileList.isNotEmpty &&
        eventText.text.isNotEmpty &&
        aboutText.text.isNotEmpty &&
        locationText.text.isNotEmpty &&
    visibleDateText.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if(selectedValue != null && selectedValueRecurring != null){
        try {
          Map<String, dynamic> postAddParameters = {
            ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
            ApiKeyConstants.title: eventText.text.toString(),
            ApiKeyConstants.about: aboutText.text.toString(),
            ApiKeyConstants.address: locationText.text.toString(),
            ApiKeyConstants.lat: lat.toString() ?? "",
            ApiKeyConstants.long: long.toString() ?? "",
            ApiKeyConstants.categoryId: "1",
            ApiKeyConstants.rating: '4',
            ApiKeyConstants.dateTime:
            '${DateFormat('dd/MM/yyyy').format(startDate!)},${pickTime ? formatedTwoTime(pickedTime!).toString() : "" }',
            ApiKeyConstants.link: 'link',
            ApiKeyConstants.visibleDate: "",
            ApiKeyConstants.recurring: "",
            ApiKeyConstants.endDate: "${DateFormat('dd/MM/yyyy').format(endDate!)}"
          };
          isBtnLoading.value = true;
          print("addEventBodyParams:-$postAddParameters");
          SimpleResponseModel? response = await ApiMethods.addEventApi(
              bodyParams: postAddParameters, imageList: fileList);
          print("response:-${response!.message.toString()}");
          if (response != null && response.status != '0') {
            // CommonWidgets.showMyToastMessage(
            //     'Add Event successfully complete ...');
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              const SnackBar(
                content: Text('Add Event successfully complete ...'),
              ),
            );
            eventText.text = '';
            aboutText.text = '';
            locationText.text = '';
            visibleDateText.text = '';
            dateRangeText.text = '';
            timeText.text = '';
            imageList = [null, null, null, null, null, null, null, null];
            selectedValue= null;
            selectedValueRecurring= null;
            increment();
            //showAlertDialogForSendInviteToFriend(response.result.toString());
          } else {
            // CommonWidgets.showMyToastMessage('Add Event failed ...');
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              const SnackBar(
                content: Text('Add Event failed ...',
                style: TextStyle(
                  color: ApkColors.orangeColor
                ),),
                backgroundColor: ApkColors.primaryColor,

              ),
            );
          }
        } catch (e) {
          print("Error:-${e.toString()}");
        }
      }
      else{
        borderColor = true;
        increment();
      }

      isBtnLoading.value = false;
    } else {
      // CommonWidgets.showMyToastMessage(
      //     'Please fill all field and select at least one image to upload ...');
      if(selectedValue == null && selectedValueRecurring == null){
        borderColor = true;
        increment();
      }

      errorImage = false;
      increment();

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text(
              'Please fill all field and select at least one image to upload ...',
            style: TextStyle(
            color: ApkColors.orangeColor
          ),),
          backgroundColor: ApkColors.primaryColor,
        ),
      );
    }
  }

  Future<void> dataCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("User id : ${prefs.getString("userid") ?? ""}");
    print("eventText id : ${eventText.text.toString()}");
    print("aboutText id : ${aboutText.text.toString()}");
    print("locationText id : ${locationText.text.toString()}");
    print("User lat id : ${lat?.toString()}");
    print("User long id : ${long?.toString()}");
    print("User category id : 1");
    print("User time id : ${pickTime ? pickedTime != null ? formatedTime(pickedTime!) : 'Time Of if Event!' : 'Time Of else Event!'}");
    print("User startDate id : ${DateFormat('dd/MM/yyyy').format(startDate!)}");
    print("User endDate id : ${DateFormat('dd/MM/yyyy').format(endDate!)}");
    //print("User endDate id : ${DateFormat("HH:mm").format(pickedTime)}");
    print("User id recurring : ${selectedValueRecurring}");
    print("User id  time and date : ${visibleDateText.text.toString()},${pickTime ? formatedTwoTime(pickedTime!).toString() : "" }");
    print(
        "User id time date : ${DateFormat("dd/MM/yyyy").format(startDate!)},${formatedTwoTime(pickedTime!)}");
  }

  void increment() => count.value++;
}
