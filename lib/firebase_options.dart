// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB3cDZ7Sh2wUTunuB8rcwqS_HBNcn2FHFA',
    appId: '1:317585237847:web:f4659befbbbe92540f4012',
    messagingSenderId: '317585237847',
    projectId: 'flutter-firebase-festival',
    authDomain: 'flutter-firebase-festival.firebaseapp.com',
    storageBucket: 'flutter-firebase-festival.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcgStZ5DTZapHguQH0qBeVVtRn-YyUqAs',
    appId: '1:317585237847:android:b661db933dae1b920f4012',
    messagingSenderId: '317585237847',
    projectId: 'flutter-firebase-festival',
    storageBucket: 'flutter-firebase-festival.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIC_R7DknOqR7f_M6tsdjtmK2CO_TlWSg',
    appId: '1:317585237847:ios:e05fd7278fb672e00f4012',
    messagingSenderId: '317585237847',
    projectId: 'flutter-firebase-festival',
    storageBucket: 'flutter-firebase-festival.appspot.com',
    iosClientId: '317585237847-lm65057ngjhapv0n721v4urgjjd0ng4p.apps.googleusercontent.com',
    iosBundleId: 'com.example.f3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIC_R7DknOqR7f_M6tsdjtmK2CO_TlWSg',
    appId: '1:317585237847:ios:68b7df517ff04a140f4012',
    messagingSenderId: '317585237847',
    projectId: 'flutter-firebase-festival',
    storageBucket: 'flutter-firebase-festival.appspot.com',
    iosClientId: '317585237847-it5l3ghj43ho57dggteiu1p3a3qrqbe1.apps.googleusercontent.com',
    iosBundleId: 'com.example.f3.RunnerTests',
  );
}
