import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearner/app/colors/ApkColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toastification/toastification.dart';

class CommonWidget {
  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  static Widget commonSearchView({
    Color? bgcolor,
    String? text,
    String? tag,
    Icon? icon,
    required VoidCallback onPressed,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    bool wantContentSizeButton = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Hero(
        tag: tag ?? 'imageHero1',
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: wantContentSizeButton ? height : Get.height * 0.054,
            margin: margin ?? const EdgeInsets.symmetric(horizontal: 15),
            padding: padding ?? const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgcolor ?? ApkColors.backgroundColor,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color:ApkColors.greenColor,
              //   width: 0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      child: icon ??
                          const Icon(Icons.search, color: ApkColors.greenColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      //color: ApkColors.greenColor,
                      child: Text(
                        text ?? 'Search here...',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Nunito-Bold',
                          color: ApkColors.greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.settings, color: ApkColors.greenColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget commonidendifire({
    Color? bgcolor,
    Color? textcolor,
    Icon? icon,
    String? text,
    required VoidCallback onPressed,
    double? height,
    double? tsize,
    double? widthsi,
    EdgeInsetsGeometry? marginc,
    bool wantContentSizeButton = false,
    bool wanttochangeicon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 30,
            alignment: Alignment.center,
            margin:
                marginc ?? EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgcolor ?? ApkColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),

            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Text(
                text ?? "Categories",
                style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    fontWeight: FontWeight.bold,
                    color: textcolor ?? ApkColors.greenColor,
                    fontSize: tsize ?? 14),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              margin:
                  marginc ?? EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 30,
              width: 30,
              padding: EdgeInsets.only(top: 2),
              child: wanttochangeicon
                  ? icon
                  : const Icon(Icons.more_horiz, color: ApkColors.greenColor),
            ),
          ),
        ],
      ),
    );
  }


  static appBar(
      {String? title,
        bool wantBackButton = true,
        required BuildContext context,
        TextStyle? styleText,
        List<Widget>? actions}) {
    return AppBar(
      elevation: 0,
      shadowColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: wantBackButton
          ? GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: CommonWidget.appIcons(
          height: 34.px,
          width: 34.px, //assetName: '',
        ),
      )
          : null,
      centerTitle: true,
      actions: actions,
      title: Text(
        title ?? '',
        style: styleText ?? Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      ),
    );
  }

  static Widget appIcons(
      { //String assetName,
        double? width,
        double? height,
        Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SvgPicture.asset(
        //   assetName,
        //   height: height ?? 24.px,
        //   width: width ?? 24.px,
        //   color: color,
        // ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: ApkColors.greenColor,
          ),
        ),
      ],
    );
  }

  static imageView({
    double? width,
    double? height,
    double? radius,
    required String image,
    String? defaultNetworkImage,
    BoxFit? fit,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SizedBox(
      height: height ?? 64.px,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8.px),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return Container(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              color:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.2.px),
              child: Image.network("https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png",
              fit:BoxFit.cover,),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(radius ?? 8.px),
              //   child: Icon(Icons.person, color: CupertinoColors.activeBlue),
              // ),
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return SizedBox(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              child: Shimmer.fromColors(
                baseColor: ApkColors.backgroundColor,
                highlightColor: ApkColors.primaryColor,
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.4.px),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget commonTextfield(
      {double? elevation,
      String? hintText,
      String? labelText,
      String? errorText,
      String? initialValue,
        bool ConFormPasswordVisible = false,
      bool PasswordVisible = false,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? contantPadiing,
      double? containerHeight,
      TextEditingController? controller,
      int? maxLines,
      double? cursorHeight,
      bool wantBorder = false,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator,
      Color? fillColor,
      Color? initialBorderColor,
      double? initialBorderWidth,
      TextInputType? keyboardType,
      double? borderRadius,
      double? maxHeight,
      TextStyle? hintStyle,
      TextStyle? style,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      //List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool autofocus = false,
      bool readOnly = false,
      bool hintTextColor = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      AutovalidateMode? autoValidateMode,
      int? maxLength,
      int? maxLine,
      int? minLine,
      VoidCallback? onTap,
      VoidCallback? onPressed,
      bool obscureText = false,
      Iterable<String>? autofillHint,
      FocusNode? focusNode,
      bool? filled,
      bool isCard = false,
      TextInputAction? textInputAction,
      bool wntsuffixIcon = false,
      bool wantPrefixIcon = true,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: ApkColors.greenColor,
      cursorErrorColor: ApkColors.orangeColor,
      maxLength: maxLength,
      maxLines: maxLine,
      minLines: minLine,
      autofocus: autofocus,
      onTap:onTap ??  (){},
      readOnly: readOnly,
      textInputAction: textInputAction ?? TextInputAction.next,
      //textCapitalization: textCapitalization ?? TextCapitalization.none,
      textAlignVertical: TextAlignVertical.top,
      style: style ??
          const TextStyle(
            fontSize: 12,
            fontFamily: 'Nunito-Bold',
            color: ApkColors.greenColor,
            fontWeight: FontWeight.bold,
          ),
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
       // labelText: labelText ?? 'Full Name',

        label: Text(
          labelText ?? 'Full Name',
          style:  TextStyle(
                fontSize: 12.px,
                fontFamily: 'NUnit-Bold',
                color: ApkColors.greenColor,
                fontWeight: FontWeight.bold,
              ),

        ),
        // isCollapsed: true,
        //  errorText: errorText ?? 'erddror',
        errorStyle: errorStyle ??
            const TextStyle(
                fontSize: 10,
                fontFamily: 'Nunito-Bold',
                color: ApkColors.orangeColor),
        prefixIcon: wantPrefixIcon ? prefixIcon ??
             const Icon(
              Icons.account_circle,
              color: ApkColors.orangeColor,
            )
            : null,
        suffixIcon: wntsuffixIcon
            ? suffixIcon ??
                IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      ConFormPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0XFFDC4036),
                    ),
                    onPressed: onPressed
                    //     () {
                    //   // Update the state i.e. toogle the state of passwordVisible variable
                    //   setState(() {
                    //     ConFormPasswordVisible =
                    //     !ConFormPasswordVisible;
                    //   });
                    // },
                    )
            : null,
        contentPadding: contantPadiing ?? EdgeInsets.all(12),
        labelStyle: labelStyle ??
            const TextStyle(
                fontSize: 12,
                fontFamily: 'Nunito-Bold',
                color: ApkColors.greenColor
            ),
        // focusColor: Colors.green,


        fillColor: fillColor ?? ApkColors.backgroundColor,
        filled: filled ?? true,
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ApkColors.greenColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApkColors.greenColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApkColors.orangeColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApkColors.orangeColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApkColors.orangeColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  static Widget commonbutten({
    Color? fillColor,
    Color? textColor,
    bool wantGradient = false,
    String? text,
    double? height,
    double? horizontalmargin,
    double? borderredius,
    double? textfontsize,
    TextStyle? style,
    Gradient? gradientcustom,
    required VoidCallback onPressed,
    bool wantBorder = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? Get.height * 0.06,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: horizontalmargin ?? 50),
        decoration: BoxDecoration(
            // color: wantGradient ? Colors.transparent
            // : fillColor ?? ApkColors.greenColor,
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ApkColors.opacity80greenColor,
                  ApkColors.greenColor,
                  ApkColors.opacity80greenColor
                ]),
            borderRadius:
                BorderRadius.all(Radius.circular(borderredius ?? 15))),
        child: Text(
          text ?? "Sign Up",
          style: style ??
              TextStyle(
                  fontFamily: 'Nunito-Bold',
                  fontWeight: FontWeight.bold,
                  color: textColor ?? ApkColors.backgroundColor,
                  //backgroundColor: Colors.transparent,
                  fontSize: textfontsize ?? 17),
        ),
      ),
    );
  }

  static Widget searchBar({
    Color? fillColor,
    Color? textColor,
    String? hinttext,
    double? height,
    double? horizontalmargin,
    double? borderredius,
    double? textfontsize,
    TextStyle? hintstyle,
    TextStyle? textfieldstyle,
    Icon? searchicon,
    Icon? backhicon,
    FocusNode? focusnode,
    required VoidCallback onPressed,
    VoidCallback? onPressededitbox,
  }) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            height: height ?? 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 5, top: 5),
            decoration: BoxDecoration(
                color: fillColor ?? ApkColors.backgroundColor,
                borderRadius: BorderRadius.circular(borderredius ?? 20)),
            width: 40,
            child: IconButton(
              onPressed: onPressed,
              icon: backhicon ??
                  const Icon(
                    CupertinoIcons.back,
                    color: ApkColors.greenColor,
                  ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 15),
            decoration: BoxDecoration(
                color: ApkColors.backgroundColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  textAlign: TextAlign.start,
                  cursorColor: ApkColors.greenColor,
                  onTap: onPressededitbox ?? () {},
                  focusNode: focusnode ?? FocusNode(),
                  style: textfieldstyle ??
                      TextStyle(
                        fontSize: textfontsize ?? 15,
                        fontFamily: 'Nunito-Bold',
                        color: textColor ?? ApkColors.greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: searchicon ??
                          const Icon(
                            Icons.search,
                            color: ApkColors.greenColor,
                          ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Get.snackbar("title", "hhj");
                        },
                        icon: Icon(
                          Icons.settings,
                          color: ApkColors.greenColor,
                        ),
                      ),
                      hintText: hinttext ?? "Search here your collage...",
                      hintStyle: hintstyle ??
                          TextStyle(
                            fontSize: textfontsize ?? 15,
                            fontFamily: 'Nunito-Bold',
                            color: textColor ?? ApkColors.greenColor,
                            fontWeight: FontWeight.bold,
                          )),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget topbargredient(
      {double? height, double? padingtop, Widget? widget}) {
    return Stack(
      children: [
        Container(
          height: height ?? Get.height * 1.04,
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                ApkColors.darkgreenColor,
                ApkColors.backgroundColor
              ]),
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: padingtop ?? 60),
          child: Container(child: widget),
        ),
      ],
    );
  }

  static Widget commonShimmer({
    double? height,
    double? width,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? highlightColor,
    Color? baseColor,
    int itemCount = 6,
    bool enabled = true,
    bool vertical = false,
    bool wantgrid = false,
    double? sidzeboxheight,
    required Widget shimmerWidget,
    //required Widget child
  }) {
    return Shimmer.fromColors(
        baseColor: baseColor ?? Color(0XFF24252A),
        highlightColor: highlightColor ?? ApkColors.backgroundColor,
        enabled: enabled,
        child: SizedBox(
          height: sidzeboxheight ?? Get.height * 0.13,
          child: wantgrid
              ? GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: itemCount,
                  physics: ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) {
                    return shimmerWidget;
                  },
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCount,
                  scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return shimmerWidget;
                  }),
        ));
  }

  ///For Check Get Api Response
  static Future<bool> responseCheckForGetMethod({
    http.Response? response,
    bool wantSuccessToast = false,
    bool wantErrorToast = true,
  }) async {
    jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null && response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

  ///For Check Post Api Response
  static Future<bool> responseCheckForPostMethod(
      {http.Response? response}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null && response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

  static void showSuccessToastMessage(String s, BuildContext c) {
    toastification.show(
        title: Text(s),
        context: c,
        description: const Text("loading please Wait"),
        autoCloseDuration: const Duration(milliseconds: 2000),
        type: ToastificationType.success,
        style: ToastificationStyle.flatColored);
  }

  static void showInfoToastMessage(String s) {
    toastification.show(
        title: Text(s),
        autoCloseDuration: const Duration(seconds: 5),
        type: ToastificationType.info,
        style: ToastificationStyle.fillColored);
  }

  static void showWarningToastMessage(String s) {
    toastification.show(
        title: Text(s),
        autoCloseDuration: const Duration(seconds: 5),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored);
  }

  static void showErrorToastMessage(String s) {
    toastification.show(
        title: Text(s),
        autoCloseDuration: const Duration(seconds: 5),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored);
  }
}
