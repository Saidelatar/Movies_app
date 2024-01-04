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
    apiKey: 'AIzaSyDoSBWBL44gTPhNEt3t8AUUzzoJkVMnlVs',
    appId: '1:574147412344:web:a6a5673fa89babc2fd888d',
    messagingSenderId: '574147412344',
    projectId: 'mlub-movies',
    authDomain: 'mlub-movies.firebaseapp.com',
    storageBucket: 'mlub-movies.appspot.com',
    measurementId: 'G-SQHBBFXFME',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ65FOe5jiMzN0jnk2NcoqAG6whEPo8Pc',
    appId: '1:574147412344:android:e2223061e9472bedfd888d',
    messagingSenderId: '574147412344',
    projectId: 'mlub-movies',
    storageBucket: 'mlub-movies.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDrXmcAwEs5Ef0IiguGHCFn8J5_nWjyGw',
    appId: '1:574147412344:ios:672e43680720f121fd888d',
    messagingSenderId: '574147412344',
    projectId: 'mlub-movies',
    storageBucket: 'mlub-movies.appspot.com',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDrXmcAwEs5Ef0IiguGHCFn8J5_nWjyGw',
    appId: '1:574147412344:ios:2fb98fb182cbd9b6fd888d',
    messagingSenderId: '574147412344',
    projectId: 'mlub-movies',
    storageBucket: 'mlub-movies.appspot.com',
    iosBundleId: 'com.example.moviesApp.RunnerTests',
  );
}