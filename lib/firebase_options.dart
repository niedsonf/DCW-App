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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCH8cMF_1zEV1Oh-kwg_z9ulAhXeG3PJtg',
    appId: '1:3840450443:web:c10265d9283f23e9b3d98e',
    messagingSenderId: '3840450443',
    projectId: 'dcw-app-fc780',
    authDomain: 'dcw-app-fc780.firebaseapp.com',
    storageBucket: 'dcw-app-fc780.appspot.com',
    measurementId: 'G-8745J910RY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8FAsJa3SHkoIJG-eCSUdb-esbCvergdo',
    appId: '1:3840450443:android:f42f890d064526d0b3d98e',
    messagingSenderId: '3840450443',
    projectId: 'dcw-app-fc780',
    storageBucket: 'dcw-app-fc780.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_QB_56y4pfcEM2ngalFThNkyH-xEB414',
    appId: '1:3840450443:ios:8a88e73c3bd71fe8b3d98e',
    messagingSenderId: '3840450443',
    projectId: 'dcw-app-fc780',
    storageBucket: 'dcw-app-fc780.appspot.com',
    iosClientId: '3840450443-lbkv80haf3rfbal4ssuavnmls3t8ubso.apps.googleusercontent.com',
    iosBundleId: 'com.example.getmage',
  );
}