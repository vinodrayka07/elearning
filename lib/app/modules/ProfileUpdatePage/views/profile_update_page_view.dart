import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/profile_update_page_controller.dart';

class ProfileUpdatePageView extends GetView<ProfileUpdatePageController> {
  const ProfileUpdatePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile',
              style: TextStyle(
                  fontFamily: 'Nunito-Bold',
                  fontWeight: FontWeight.w700,
                  color: ApkColors.greenColor,
                  fontSize: 22.px)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                controller.count.value;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.clickGalleryTextButtonView(
                                  context: context, index: 0);
                            },
                            child: CircleAvatar(
                              backgroundColor: ApkColors.greenColor,
                              radius: 37.px,
                              child: CircleAvatar(
                                backgroundColor: ApkColors.primaryColor,
                                radius: 35.px,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Stack(
                                    children: [
                                      controller.Image != null
                                          ? Center(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15.px),
                                                  ),
                                                  child: Image.file(
                                                    height: 100.px,
                                                    width: 100.px,
                                                    fit: BoxFit.cover,
                                                    File(
                                                      controller.Image!.path,
                                                    ),
                                                  )),
                                            )
                                          : CommonWidget.imageView(
                                              image: controller.userModel
                                                      ?.result?.image ??
                                                  "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png",
                                              height: 80.px,
                                              width: 80.px,
                                              defaultNetworkImage:
                                                  "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png"),
                                      // controller.imageList[index] != null
                                      //     ? SizedBox()
                                      //     : Center(
                                      //         child: IconButton(
                                      //           onPressed: () {
                                      //             controller
                                      //                 .clickGalleryTextButtonView(
                                      //                     context: context,
                                      //                     index: index);
                                      //           },
                                      //           icon: const Icon(
                                      //             Icons.add,
                                      //             color: ApkColors.greenColor,
                                      //           ),
                                      //         ),
                                      //       )
                                    ],
                                  ),

                                  // Icon(Icons.location_on,
                                  // color:ApkColors.greenColor,
                                  // size: 50.px,),
                                ),
                                //CircleAvatar
                              ), //CircleAvatar
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.clickGalleryTextButtonView(
                                  context: context, index: 0);
                            },
                            child: Container(
                                height: 95.px,
                                width: 80.px,
                                alignment: Alignment.bottomCenter,
                                // color: ApkColors.primaryColor,
                                child: CircleAvatar(
                                  backgroundColor: ApkColors.greenColor,
                                  radius: 18.px,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.px),
                                    child: Container(
                                        color: ApkColors.primaryColor,
                                        padding: EdgeInsets.all(5.px),
                                        child: Icon(
                                          Icons.edit,
                                          color: ApkColors.greenColor,
                                          size: 20.px,
                                        )),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
              Obx(() {
                controller.count.value;
                return Container(
                  //color: Colors.cyan,

                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CommonWidget.commonTextfield(
                      validator: controller.firstNameValidator,
                      labelText: "First Name",
                      autofocus: false,
                      wantPrefixIcon: false,
                      keyboardType: TextInputType.text,
                      controller: controller.firstName),
                );
              }),
              SizedBox(
                height: 30.px,
              ),
              Obx(() {
                controller.count.value;
                return Container(
                  //color: Colors.cyan,

                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CommonWidget.commonTextfield(
                      validator: controller.lastNameValidator,
                      labelText: "Last Name",
                      autofocus: false,
                      wantPrefixIcon: false,
                      keyboardType: TextInputType.text,
                      controller: controller.lastName),
                );
              }),
              SizedBox(
                height: 30.px,
              ),
              Obx(() {
                controller.count.value;
                return Container(
                  //color: Colors.cyan,

                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CommonWidget.commonTextfield(
                      validator: controller.dateOfBirthValidator,
                      labelText: "Date of Birth",
                      autofocus: false,
                      wantPrefixIcon: false,
                      keyboardType: TextInputType.text,
                      controller: controller.dateOfBirth),
                );
              }),
              SizedBox(
                height: 30.px,
              ),
              Obx(() {
                controller.count.value;
                return Container(
                  //color: Colors.cyan,

                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CommonWidget.commonTextfield(
                      validator: controller.emailValidator,
                      labelText: "Email",
                      autofocus: false,
                      wantPrefixIcon: false,
                      keyboardType: TextInputType.text,
                      controller: controller.email),
                );
              }),
              SizedBox(
                height: 30.px,
              ),
              Obx(() {
                controller.count.value;
                return Container(
                  //color: Colors.cyan,

                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: CommonWidget.commonTextfield(
                      validator: controller.mobileValidator,
                      labelText: "Mobile Number",
                      autofocus: false,
                      wantPrefixIcon: false,
                      keyboardType: TextInputType.text,
                      controller: controller.mobileNumber),
                );
              }),
              SizedBox(
                height: 30.px,
              ),
              Obx(() {
                controller.count.value;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: ApkColors.backgroundColor,
                      border: Border.all(
                          color: controller.borderColor
                              ? ApkColors.orangeColor
                              : ApkColors.greenColor,
                          width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,

                      hint: Text(
                        controller.userModel?.result == null
                            ? "Select Gender"
                            : controller.userModel?.result?.gender == "Male"
                        ? "MALE"
                            : "Select Gender"
                        ,

                        style: TextStyle(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito-Bold',
                            color: ApkColors.greenColor),
                      ),
                      items: controller.itemsOfRecurring
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: controller.selectedValueRecurring,
                      onChanged: (value) {
                        controller.selectedValueRecurring =
                            value == '' && value == null
                                ? controller.selectedValueRecurring
                                : value;
                        controller.increment();
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 50,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                      iconStyleData: const IconStyleData(
                          iconDisabledColor: ApkColors.orangeColor,
                          iconEnabledColor: ApkColors.greenColor),
                      dropdownSearchData: DropdownSearchData(
                        searchController:
                            controller.searchRecurringDropDownController,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller:
                                controller.searchRecurringDropDownController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search Recurring...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return item.value.toString().contains(searchValue);
                        },
                      ),
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          controller.searchRecurringDropDownController.clear();
                        }
                      },
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 30.px,
              ),
              GestureDetector(
                onTap: () {
                  // controller.getLatLang(
                  //controller.address);
                  // controller.formKey.currentState?.validate();
                  controller.postAddApi();
                  //controller.dataCheck();
                },
                child: Container(
                    height: 60.px,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30.px),
                    decoration: BoxDecoration(
                        color: Color(0XFF15C55D),
                        borderRadius: BorderRadius.all(Radius.circular(15.px))),
                    child: controller.isBtnLoading.value
                        ? const RefreshProgressIndicator(
                            backgroundColor: ApkColors.backgroundColor,
                          )
                        : Text(
                            "Publish",
                            style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontWeight: FontWeight.bold,
                                color: ApkColors.backgroundColor,
                                backgroundColor: Colors.transparent,
                                fontSize: 20.px),
                          )),
              ),
            ],
          ),
        ));
  }
}
