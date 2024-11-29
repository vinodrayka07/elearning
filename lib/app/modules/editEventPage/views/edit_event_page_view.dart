import 'dart:io';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/edit_event_page_controller.dart';

class EditEventPageView extends GetView<EditEventPageController> {
  const EditEventPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      controller.count.value;
      return Scaffold(
          appBar: CommonWidget.appBar(
            context: context,
            title: "Edit Event",
            wantBackButton: true,
            styleText: TextStyle(
              fontSize: 22.px,
              fontFamily: 'NUnit-Bold',
              color: ApkColors.greenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: controller.condition
                      ? SingleChildScrollView(
                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: const ScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                //color: Colors.cyan,

                                margin:
                                EdgeInsets.symmetric(horizontal: 30),
                                child: CommonWidget.commonTextfield(
                                    validator:
                                    controller.eventTextValidator,
                                    labelText: "Event Name",
                                    autofocus: true,
                                    wantPrefixIcon: false,
                                    keyboardType: TextInputType.text,
                                    controller: controller.eventText),
                              );
                            }),
                            SizedBox(
                              height: 20.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 30),
                                decoration: BoxDecoration(
                                    color: ApkColors.backgroundColor,
                                    border: Border.all(
                                        color: controller.borderColor ? ApkColors.orangeColor :  ApkColors.greenColor,
                                        width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,

                                    hint: Text(
                                      "Select category",
                                      style: TextStyle(
                                          fontSize: 12.px,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Nunito-Bold',
                                          color: ApkColors.greenColor),
                                    ),
                                    items: controller.items
                                        .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: controller
                                          .items.isEmpty
                                          ? RefreshProgressIndicator(
                                        backgroundColor:
                                        ApkColors
                                            .backgroundColor,
                                      )
                                          : Text(
                                        item ?? 'null',
                                        style:
                                        const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    value: controller.selectedValue,
                                    onChanged: (value) {
                                      controller.selectedValue = value;
                                      controller.increment();
                                    },
                                    buttonStyleData:
                                    const ButtonStyleData(
                                      height: 50,
                                    ),
                                    dropdownStyleData:
                                    const DropdownStyleData(
                                      maxHeight: 200,
                                    ),
                                    menuItemStyleData:
                                    const MenuItemStyleData(
                                      height: 40,
                                    ),
                                    iconStyleData: const IconStyleData(
                                        iconDisabledColor:
                                        ApkColors.orangeColor,
                                        iconEnabledColor:
                                        ApkColors.greenColor),
                                    dropdownSearchData:
                                    DropdownSearchData(
                                      searchController: controller
                                          .searchDropDownController,
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
                                          controller: controller
                                              .searchDropDownController,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                            const EdgeInsets
                                                .symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            hintText:
                                            'Search for a category...',
                                            hintStyle: const TextStyle(
                                                fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return item.value
                                            .toString()
                                            .contains(searchValue);
                                      },
                                    ),
                                    //This to clear the search value when you close the menu
                                    onMenuStateChange: (isOpen) {
                                      if (!isOpen) {
                                        controller
                                            .searchDropDownController
                                            .clear();
                                      }
                                    },
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              height: 20.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 30),
                                decoration: BoxDecoration(
                                    color: ApkColors.backgroundColor,
                                    border: Border.all(
                                        color: controller.borderColor ? ApkColors.orangeColor :  ApkColors.greenColor ,
                                        width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,

                                    hint: Text(
                                      "Select recurring",
                                      style: TextStyle(
                                          fontSize: 12.px,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Nunito-Bold',
                                          color: ApkColors.greenColor),
                                    ),
                                    items: controller.itemsOfRecurring
                                        .map((item) => DropdownMenuItem(
                                      value: item,
                                      child:
                                      Text(
                                        item ,
                                        style:
                                        const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    value: controller.selectedValueRecurring,
                                    onChanged: (value) {
                                      controller.selectedValueRecurring = value;
                                      controller.increment();
                                    },
                                    buttonStyleData:
                                    const ButtonStyleData(
                                      height: 50,
                                    ),
                                    dropdownStyleData:
                                    const DropdownStyleData(
                                      maxHeight: 200,
                                    ),
                                    menuItemStyleData:
                                    const MenuItemStyleData(
                                      height: 40,
                                    ),
                                    iconStyleData: const IconStyleData(
                                        iconDisabledColor:
                                        ApkColors.orangeColor,
                                        iconEnabledColor:
                                        ApkColors.greenColor),
                                    dropdownSearchData:
                                    DropdownSearchData(
                                      searchController: controller
                                          .searchRecurringDropDownController,
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
                                          controller: controller
                                              .searchRecurringDropDownController,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                            const EdgeInsets
                                                .symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            hintText:
                                            'Search Recurring...',
                                            hintStyle: const TextStyle(
                                                fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return item.value
                                            .toString()
                                            .contains(searchValue);
                                      },
                                    ),
                                    //This to clear the search value when you close the menu
                                    onMenuStateChange: (isOpen) {
                                      if (!isOpen) {
                                        controller
                                            .searchRecurringDropDownController
                                            .clear();
                                      }
                                    },
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              height: 30.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                //color: ApkColors.primaryColor,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: CommonWidget.commonTextfield(
                                      onTap: () {
                                        showCustomDateRangePicker(
                                          context,
                                          dismissible: true,
                                          minimumDate: DateTime.now()
                                              .subtract(const Duration(
                                              days: 30)),
                                          maximumDate: DateTime.now()
                                              .add(const Duration(
                                              days: 30)),
                                          endDate: controller.endDate,
                                          startDate:
                                          controller.startDate,
                                          backgroundColor:
                                          ApkColors.backgroundColor,
                                          primaryColor: ApkColors.greenColor,
                                          onApplyClick: (start, end) {
                                            controller.pickedDate =
                                            true;
                                            print(
                                                "PickedDate${controller.pickedDate}");

                                            controller.endDate = end;
                                            controller.startDate =
                                                start;
                                            controller.dateRangeText = TextEditingController(text: '${ DateFormat("dd/MM/yyyy").format(start) } to ${ DateFormat("dd/MM/yyyy").format(end)}',);
                                            controller.increment();
                                          },
                                          onCancelClick: () {
                                            controller.pickedDate =
                                            false;
                                            print(
                                                "PickedDate${controller.pickedDate}");

                                            controller.endDate = null;
                                            controller.startDate = null;
                                            controller.increment();
                                          },
                                        );
                                      },
                                      validator: controller
                                          .dateRangeTextValidator,
                                      labelText: "Select date range",
                                      autofocus: false,
                                      readOnly: true,
                                      wantPrefixIcon: false,
                                      wntsuffixIcon: true,
                                      suffixIcon: Icon(
                                        Icons.date_range_rounded,
                                        color: ApkColors.greenColor,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller:
                                      controller.dateRangeText));
                            }),
                            SizedBox(
                              height: 30.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: CommonWidget.commonTextfield(
                                      onTap: (){

                                        controller.selectDate(context);

                                      },
                                      validator: controller
                                          .visibleDateTextValidator,
                                      labelText: "Select visible date",
                                      autofocus: true,
                                      readOnly: false,
                                      wantPrefixIcon: false,
                                      wntsuffixIcon: true,
                                      suffixIcon: const Icon(
                                        Icons.date_range_rounded,
                                        color: ApkColors.greenColor,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller:
                                      controller.visibleDateText));
                            }),
                            SizedBox(
                              height: 30.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: CommonWidget.commonTextfield(
                                      onTap: () {
                                        controller.selectTime(context);},
                                      validator: controller
                                          .timeTextValidator,
                                      labelText: "Select time of event",
                                      autofocus: false,
                                      readOnly: true,
                                      wantPrefixIcon: false,
                                      wntsuffixIcon: true,
                                      suffixIcon: Icon(
                                        CupertinoIcons.time_solid,
                                        color: ApkColors.greenColor,
                                      ),
                                      keyboardType: TextInputType.text,
                                      controller:
                                      controller.timeText));
                            }),

                            SizedBox(
                              height: 30.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30),
                                child: CommonWidget.commonTextfield(
                                    validator: controller
                                        .locationTextValidator,
                                    labelText: "Location",
                                    autofocus: true,
                                    wntsuffixIcon: true,
                                    suffixIcon: Container(
                                      decoration: BoxDecoration(
                                          color: ApkColors.backgroundColor,
                                          border: Border.all(
                                              color:controller.errorImage ? ApkColors.greenColor : ApkColors.orangeColor,
                                              width: 1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: const EdgeInsets.all(1),
                                      child: TextButton.icon(onPressed: (){
                                        show(context, controller);
                                      },
                                        label: Text("Search here",
                                            style: TextStyle(
                                                fontSize: 12.px,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Nunito-Bold',
                                                color: ApkColors.greenColor)
                                        ),icon: Icon(CupertinoIcons.search,color: ApkColors.greenColor,),
                                      ),
                                    ),
                                    wantPrefixIcon: false,
                                    keyboardType: TextInputType.text,
                                    controller:
                                    controller.locationText),
                              );

                              //   Row(
                              //   children: [
                              //     Container(
                              //       //color: Colors.cyan,
                              //       padding: const EdgeInsets.symmetric(
                              //           horizontal: 30),
                              //       child: CommonWidget.commonTextfield(
                              //           validator: controller
                              //               .locationTextValidator,
                              //           labelText: controller.address !=
                              //                   null
                              //               ? "Address: ${controller.address}"
                              //               : "Location",
                              //           autofocus: true,
                              //           wantPrefixIcon: false,
                              //           keyboardType: TextInputType.text,
                              //           controller:
                              //               controller.locationText),
                              //     ),
                              //     OutlinedButton(
                              //       child:
                              //           Text('show dialog'.toUpperCase()),
                              //       onPressed: () {
                              //         showDialog(
                              //           context: context,
                              //           builder: (context) {
                              //             return AlertDialog(
                              //               title: const Text('Example'),
                              //               content: PlacesAutocomplete(
                              //                 apiKey:
                              //                     "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
                              //                 searchHintText:
                              //                     "Search for a place",
                              //                 mounted: true,
                              //                 hideBackButton: true,
                              //                 initialValue:
                              //                     controller.initialValue,
                              //                 onSuggestionSelected:
                              //                     (value) {
                              //                   controller
                              //                           .autocompletePlace =
                              //                       value.structuredFormatting
                              //                               ?.mainText ??
                              //                           "";
                              //                   controller.initialValue =
                              //                       value;
                              //                   controller.increment();
                              //                 },
                              //                 onGetDetailsByPlaceId:
                              //                     (value) {
                              //                   controller.address = value
                              //                           ?.result
                              //                           .formattedAddress ??
                              //                       "";
                              //                   controller.increment();
                              //                 },
                              //               ),
                              //               actions: <Widget>[
                              //                 TextButton(
                              //                   child: const Text('Done'),
                              //                   onPressed: () =>
                              //                       Navigator.of(context)
                              //                           .pop(),
                              //                 ),
                              //               ],
                              //             );
                              //           },
                              //         );
                              //       },
                              //     )
                              //   ],
                              // );
                            }),
                            SizedBox(
                              height: 30.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: SizedBox(
                                    height: 200.px,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                      child: Stack(
                                        children: [
                                          GoogleMap(
                                            mapType: MapType.normal,
                                            myLocationButtonEnabled: true,
                                            myLocationEnabled: true,
                                            style:
                                            controller.mapStyleString,
                                            initialCameraPosition:
                                            CameraPosition(
                                              target: LatLng(
                                                double.parse(controller.getEventDetails?.result?.lat ??
                                                  "29.146727" ),
                                                  double.parse(controller.getEventDetails?.result?.long ??
                                                      "76.464895", )),
                                              zoom: 14.4746,
                                            ),
                                            gestureRecognizers: {
                                              Factory<OneSequenceGestureRecognizer>(
                                                      () =>
                                                      EagerGestureRecognizer())
                                            },
                                            onMapCreated:
                                                (GoogleMapController
                                            googleController) {
                                              controller.mapcontroller
                                                  .complete(
                                                  googleController);
                                            },
                                            // markers: {
                                            //   Marker(
                                            //     markerId:
                                            //     MarkerId('marker_1'),
                                            //     position: LatLng(
                                            //         double.parse(controller.getEventDetails?.result?.lat ??
                                            //             "29.146727" ),
                                            //         double.parse(controller.getEventDetails?.result?.long ??
                                            //             "76.464895", )),
                                            //   ),
                                            // },
                                          ),
                                          Obx(() {
                                            controller.count.value;
                                            return Padding(
                                              padding: EdgeInsets.all(5),
                                              child: ElevatedButton(
                                                child: Text(
                                                  'Pick location',
                                                  style: TextStyle(
                                                      color: ApkColors
                                                          .greenColor),
                                                ),
                                                onPressed: () async {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return KeyboardVisibilityBuilder(
                                                            builder: (context,
                                                                isKeyboardVisible) {
                                                              return MapLocationPicker(
                                                                apiKey:
                                                                "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
                                                                popOnNextButtonTaped:
                                                                true,
                                                                backButton:
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  icon: Icon(
                                                                      CupertinoIcons
                                                                          .back),
                                                                ),
                                                                hideLocationButton:
                                                                false,
                                                                location: Location(
                                                                    lat: controller
                                                                        .position
                                                                        ?.latitude ??
                                                                        29.146727,
                                                                    lng: controller
                                                                        .position
                                                                        ?.longitude ??
                                                                        76.464895),
                                                                hideMapTypeButton:
                                                                true,
                                                                mapStyle:
                                                                controller
                                                                    .mapStyleString,
                                                                currentLatLng: LatLng(
                                                                    controller
                                                                        .position
                                                                        ?.latitude ??
                                                                        29.146727,
                                                                    controller
                                                                        .position
                                                                        ?.longitude ??
                                                                        76.464895),
                                                                onNext:
                                                                    (GeocodingResult?
                                                                result) {
                                                                  if (result !=
                                                                      null) {
                                                                    controller
                                                                        .address =
                                                                        result.formattedAddress ??
                                                                            "";
                                                                    print(
                                                                        "address is :${controller.address}");
                                                                    controller
                                                                        .getLatLang(
                                                                        controller.address);
                                                                    controller
                                                                        .locationText =
                                                                        TextEditingController(
                                                                            text: controller.address ?? " ");
                                                                    controller
                                                                        .increment();
                                                                  }
                                                                },
                                                                onSuggestionSelected:
                                                                    (PlacesDetailsResponse?
                                                                result) {
                                                                  if (result !=
                                                                      null) {
                                                                    controller
                                                                        .autocompletePlace = result
                                                                        .result
                                                                        .formattedAddress ??
                                                                        "";
                                                                    print(
                                                                        "address is :${controller.address}");
                                                                    // controller.getLatLang(controller.address);
                                                                    // controller.locationText = TextEditingController(text: controller.address ?? " ");
                                                                    controller
                                                                        .increment();
                                                                  }
                                                                },
                                                              );
                                                            });
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ));
                            }),
                            SizedBox(
                              height: 30.px,
                            ),
                            Obx(() {
                              controller.count.value;
                              return Container(
                                padding:
                                EdgeInsets.symmetric(horizontal: 30),
                                child: CommonWidget.commonTextfield(
                                    validator:
                                    controller.aboutTextValidator,
                                    labelText: "About Event",
                                    autofocus: true,
                                    maxLines: 8,
                                    minLine: 5,
                                    maxLength: 350,
                                    // containerHeight: 100.px,
                                    wantPrefixIcon: false,
                                    // contantPadiing: EdgeInsets.symmetric(
                                    //     horizontal: 12, vertical: 50),
                                    keyboardType: TextInputType.text,
                                    controller: controller.aboutText),
                              );
                            }),

                            SizedBox(
                              height: 20.px,
                            ),
                            Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 30),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Photo',
                                style: TextStyle(
                                    fontSize: 22.px,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito-Bold',
                                    color: ApkColors.greenColor),
                              ),
                            ),
                            SizedBox(
                              height: 30.px,
                            ),

                            Obx(() {
                              controller.count.value;
                              return Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 20),
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: controller.imageList.length,
                                  physics: const ClampingScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    mainAxisExtent: 60.px,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(15)),
                                            color: ApkColors.primaryColor,
                                            border: Border.all(
                                                width: 1.px,
                                                color: controller.errorImage  ?  ApkColors.greenColor : ApkColors.orangeColor
                                            )),
                                        height: 60.px,
                                        width: 60.px,
                                        child: Stack(
                                          children: [
                                            controller.imageList[index] !=
                                                null
                                                ? Center(
                                              child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .all(
                                                    Radius.circular(
                                                        15.px),
                                                  ),
                                                  child: Image.file(
                                                    height: 60.px,
                                                    width: 60.px,
                                                    fit: BoxFit
                                                        .cover,
                                                    File(
                                                      controller
                                                          .imageList[
                                                      index]!
                                                          .path,
                                                    ),
                                                  )),
                                            )
                                                : SizedBox(),
                                            controller.imageList[index] !=
                                                null
                                                ? SizedBox()
                                                : Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  controller.clickGalleryTextButtonView(context: context, index: index);
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: ApkColors
                                                      .greenColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                            SizedBox(
                              height: 25.px,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.getLatLang(
                                    controller.address);
                                controller.formKey.currentState!.validate();
                                controller.postAddApi();
                                // controller.dataCheck();
                              },
                              child: Container(
                                  height: 60,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  decoration: BoxDecoration(
                                      color: Color(0XFF15C55D),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: controller.isBtnLoading.value
                                      ? const RefreshProgressIndicator(
                                    backgroundColor:
                                    ApkColors.backgroundColor,
                                  )
                                      : Text(
                                    "Update Event",
                                    style: TextStyle(
                                        fontFamily: 'Nunito-Bold',
                                        fontWeight: FontWeight.bold,
                                        color: ApkColors
                                            .backgroundColor,
                                        backgroundColor:
                                        Colors.transparent,
                                        fontSize: 20.px),
                                  )),
                            ),
                            SizedBox(
                              height: 30.px,
                            ),
                          ]),
                    ),
                  )
                      : Column(
                    children: [
                      Obx(() {
                        controller.count.value;
                        return PlacesAutocomplete(
                          searchController: controller.controllerSearch,
                          apiKey:
                          "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
                          mounted: true,
                          hideBackButton: true,
                          onGetDetailsByPlaceId:
                              (PlacesDetailsResponse? result) {
                            if (result != null) {
                              controller.autocompletePlace =
                                  result.result.formattedAddress ?? "";
                              controller.increment();
                            }
                          },
                        );
                      }),
                      Obx(() {
                        controller.count.value;
                        return OutlinedButton(
                          child: Text('show dialog'.toUpperCase()),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('location'),
                                  content: PlacesAutocomplete(
                                    apiKey:
                                    "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
                                    searchHintText: "Search for a place",
                                    mounted: true,
                                    hideBackButton: true,
                                    initialValue: controller.initialValue,
                                    onSuggestionSelected: (value) {
                                      controller.autocompletePlace = value
                                          .structuredFormatting
                                          ?.mainText ??
                                          "";
                                      controller.initialValue = value;
                                      controller.increment();
                                    },
                                    onGetDetailsByPlaceId: (value) {
                                      controller.address = value
                                          ?.result.formattedAddress ??
                                          "";
                                      controller.increment();
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Done'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      }),
                      Obx(() {
                        controller.count.value;
                        return ElevatedButton(
                          child: Text(
                            'Pick location',
                            style:
                            TextStyle(color: ApkColors.orangeColor),
                          ),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MapLocationPicker(
                                    apiKey:
                                    "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
                                    popOnNextButtonTaped: true,
                                    currentLatLng: const LatLng(
                                        29.146727, 76.464895),
                                    onNext: (GeocodingResult? result) {
                                      if (result != null) {
                                        controller.address =
                                            result.formattedAddress ?? "";
                                      }
                                    },
                                    onSuggestionSelected:
                                        (PlacesDetailsResponse? result) {
                                      if (result != null) {
                                        controller.autocompletePlace =
                                            result.result
                                                .formattedAddress ??
                                                "";
                                      }
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }),
                      Obx(() {
                        controller.count.value;
                        return ListTile(
                          title: Text(
                            "Geocoded Address: ${controller.address}",
                            style:
                            TextStyle(color: ApkColors.orangeColor),
                          ),
                        );
                      }),
                    ],
                  ))
            ],
          ));
    });
  }
}

Future<void> show(BuildContext context, EditEventPageController controller)  async{
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: Text(
          'Search for location',
          style: TextStyle(
              fontSize: 15.px,
              fontFamily:
              'Nunito-Bold',
              fontWeight:
              FontWeight.bold,
              color: Color(
                  0XFF15C55D)),
        ),
        content: PlacesAutocomplete(
          apiKey:
          "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
          searchHintText:
          "Search for a place",
          mounted: true,
          topCardColor:
          ApkColors.greenColor,
          hideBackButton: true,
          initialValue: controller
              .initialValue,
          onSuggestionSelected:
              (value) {
            controller
                .autocompletePlace = value
                .structuredFormatting
                ?.mainText ??
                "";
            controller
                .initialValue =
                value;
            controller.address = '';
            controller.increment();
          },
          onGetDetailsByPlaceId:
              (value) {
            controller
                .address = value
                ?.result
                .formattedAddress ??
                "";
            print(
                "address is :${controller.address}");
            controller.getLatLang(
                controller.address);
            controller.locationText = TextEditingController(text: controller.address ?? " ");
            controller.increment();
          },
        ),
        actions: <Widget>[
          TextButton(
              child: const Text(
                  'Done'),
              onPressed: () {
                print(
                    "address is :${controller.address}");
                controller.getLatLang(
                    controller
                        .address);
                controller
                    .locationText =
                    TextEditingController(
                        text: controller
                            .address ??
                            " ");
                Navigator.of(
                    context)
                    .pop();
              }),
          TextButton(
              child: const Text(
                  "cancel"),
              onPressed: () {
                controller
                    .locationText =
                    TextEditingController(
                        text: "");
                controller
                    .increment();
                Navigator.of(
                    context)
                    .pop();
              }),
        ],
      );
    },
  );

}
