import 'dart:io';
import 'package:elearner/app/data/apis/Api_Models/get_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../../CommonFile/image_pick_and_crop.dart';
import '../../../colors/ApkColors.dart';
import '../../../data/apis/Api_Key_Constants/api_key_constants.dart';
import '../../../data/apis/Api_Methods/api_methods.dart';
import '../../../data/apis/StringConstants/StringConstants.dart';

class ProfileUpdatePageController extends GetxController {
  //TODO: Implement ProfileUpdatePageController

  final count = 0.obs;
  String? value;

  File? Image;
  var formKey = GlobalKey<FormState>();



  TextEditingController eventText = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();

  UserModel? userModel;

  bool borderColor = false;
  RxBool isBtnLoading = false.obs;
  bool isLoading = true;
  final List<String> itemsOfRecurring = [
    'Male',
    'Female',
    'Others',
  ];
  String? selectedValueRecurring;
  final TextEditingController searchRecurringDropDownController =
  TextEditingController();


  @override
  void onInit() {
    getProfileData();
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

  getProfileData() async {
    if (await CommonWidget.internetConnectionCheckerMethod()) {
      isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("email"));
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: prefs.getString("userid") ?? "46",
      };
      try {
        if (await CommonWidget.internetConnectionCheckerMethod()) {
          userModel = await ApiMethods.getProfile(bodyParams: bodyParams);
          if (userModel != null && userModel?.status != '0') {
            isLoading = false;


            print(userModel?.result?.firstName);
            firstName = TextEditingController(text: userModel?.result?.firstName ?? "");
            print(userModel?.result?.lastName);
            lastName = TextEditingController(text: userModel?.result?.lastName ?? "");
            print(userModel?.result?.dob);
            dateOfBirth = TextEditingController(text: userModel?.result?.dob ?? "");
            print(userModel?.result?.email);
            email = TextEditingController(text: userModel?.result?.email ?? "");
            print(userModel?.result?.mobile);
            mobileNumber = TextEditingController(text: userModel?.result?.mobile ?? "");
            print(userModel?.result?.gender);
           // selectedValueRecurring = userModel?.result?.gender ?? "ss" ;

            print(userModel?.result?.image);

            increment();


          } else {
            Get.snackbar("Error", userModel!.message ?? '');
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

  Future<void> postAddApi() async {
    if (Image != null &&
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        mobileNumber.text.isNotEmpty &&
        dateOfBirth.text.isNotEmpty) {
     // SharedPreferences prefs = await SharedPreferences.getInstance();


        try {

          Map<String, dynamic> postAddParameters = {
            ApiKeyConstants.userId:  "46",
            ApiKeyConstants.firstName: firstName.text.toString(),
            ApiKeyConstants.lastName: lastName.text.toString(),
            ApiKeyConstants.email: email.text.toString(),
            ApiKeyConstants.mobile: mobileNumber.text.toString() ,
            ApiKeyConstants.gender: selectedValueRecurring ?? (userModel?.result?.gender == ""
                ? "Select Gender"
                : userModel?.result?.gender ??
                "Select Gender"),
            ApiKeyConstants.dob:dateOfBirth.text.toString() ,

          };
          Map<String, File>? postImage = {
            ApiKeyConstants.image:Image ?? File(""),
          };
          isBtnLoading.value = true;
          print("addEventBodyParams:-$postAddParameters");
          UserModel? response = await ApiMethods.updateProfileApi(
              bodyParams: postAddParameters, imageMap: postImage);
          print("response:-${response!.message.toString()}");
          if (response != null && response.status != '0') {
            // CommonWidgets.showMyToastMessage(
            //     'Add Event successfully complete ...');
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              const SnackBar(
                content: Text('update profile successfully...'),
              ),
            );
            eventText.text = '';
            firstName.text = '';
            lastName.text = '';
            email.text = '';
            mobileNumber.text = '';
            dateOfBirth.text = '';
            selectedValueRecurring = '';
            Image = null;
            increment();
            //showAlertDialogForSendInviteToFriend(response.result.toString());
          } else {
            // CommonWidgets.showMyToastMessage('Add Event failed ...');
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              const SnackBar(
                content: Text('Profile update failed ...',
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



      isBtnLoading.value = false;
    } else {
      // CommonWidgets.showMyToastMessage(
      //     'Please fill all field and select at least one image to upload ...');
      // if(selectedValueRecurring == null){
      //   borderColor = true;
      //   increment();
      // }

      //errorImage = false;


      print("first name : ${firstName.text}");
      print("last name : ${lastName.text}");
      print("email : ${email.text}");
      print("date name : ${dateOfBirth.text}");
      print("mobile name : ${mobileNumber.text}");
      print("gender name : ${selectedValueRecurring}");
      print("image name : ${Image?.path ?? ""}");

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
      increment();
    }
  }

  Future<void> clickGalleryTextButtonView(
      {required BuildContext context, required int index}) async {
    pickGallery(context: context, index: index);
    // Navigator.pop(context);
  }

  Future<void> pickGallery(
      {required BuildContext context, required int index}) async {
    Image = await ImagePickerAndCropper.pickImage(
        context: context,
        wantCropper: true,
        color: Theme.of(context).primaryColor,
        pickImageFromGallery: true);
   // imageList[index] = image;
    print(Image?.path);
    increment();
  }


  FormFieldValidator<String>? firstNameValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("first Name is required");
    } else
      return null;
  };
  FormFieldValidator<String>? emailValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("email is required");
    } else
      return null;
  };
  FormFieldValidator<String>? lastNameValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("last Name is required");
    } else
      return null;
  };
  FormFieldValidator<String>? dateOfBirthValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("date of Birth is required");
    } else
      return null;
  };
  FormFieldValidator<String>? mobileValidator = (String? value) {
    var nonNullValue = value ?? '';
    if (nonNullValue.isEmpty) {
      return ("mobile number is required");
    } else
      return null;
  };

  void increment() => count.value++;

  void dataCheck() {

    print("first name : ${firstName.text}");
    print("last name : ${lastName.text}");
    print("email : ${email.text}");
    print("date name : ${dateOfBirth.text}");
    print("mobile name : ${mobileNumber.text}");
    print("gender name : ${selectedValueRecurring}");
    print("image name : ${Image?.path ?? ""}");



  }
}
