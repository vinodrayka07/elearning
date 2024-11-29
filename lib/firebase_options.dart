// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzfAlVQucLKCVnW0yQQQBzFdyY8EF3f04',
    appId: '1:966559909193:android:34c0d47fe7b6792cfdc698',
    messagingSenderId: '966559909193',
    projectId: 'elearner-131f1',
    databaseURL: 'https://elearner-131f1-default-rtdb.firebaseio.com',
    storageBucket: 'elearner-131f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxOsIJ5Y_Frk2STt9WoHNtvqxq0oWK8Ek',
    appId: '1:966559909193:ios:de46a7ff74e04f8bfdc698',
    messagingSenderId: '966559909193',
    projectId: 'elearner-131f1',
    databaseURL: 'https://elearner-131f1-default-rtdb.firebaseio.com',
    storageBucket: 'elearner-131f1.appspot.com',
    iosBundleId: 'com.rayka.elearner',
  );

}