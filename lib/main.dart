import 'package:elearner/app/colors/ApkColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ApkColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      //systemNavigationBarIconBrightness: Brightness.dark));
  ));
  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: ApkColors.orangeColor,
          onSurface: ApkColors.greenColor,
          surface: ApkColors.backgroundColor,
          secondary: ApkColors.orangeColor,
          onSecondary : ApkColors.primaryColor,
          onPrimary: ApkColors.primaryColor,
          onPrimaryFixed:Colors.amber,
          primaryContainer: ApkColors.primaryColor,
          onPrimaryContainer:ApkColors.greenColor,
          secondaryContainer:ApkColors.orangeColor,
          background: ApkColors.backgroundColor,
          onSecondaryContainer: ApkColors.greenColor,
          error: ApkColors.orangeColor,
          onError: ApkColors.orangeColor,
        ),
      //   dividerTheme: const DividerThemeData(color: Colors.blue),
      //     unselectedWidgetColor:ApkColors.greenColor,
      //     disabledColor:ApkColors.greenColor,
      //     canvasColor:Colors.orange,
      //     textTheme: Typography.whiteRedmond,
      //     bottomSheetTheme:BottomSheetThemeData(
      //       backgroundColor: ApkColors.greenColor
      //
      // ),
      //     listTileTheme:ListTileThemeData(
      //       textColor: ApkColors.greenColor
      //     )
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
