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
        return windows;
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
    apiKey: 'AIzaSyDfOu9oROP94SILLx8gAvDgSQEscJP8ncM',
    appId: '1:257942852492:web:93d2cfd6d6eeedccb03ca9',
    messagingSenderId: '257942852492',
    projectId: 'rseume-dc971',
    authDomain: 'rseume-dc971.firebaseapp.com',
    storageBucket: 'rseume-dc971.appspot.com',
    measurementId: 'G-RDP01NLT69',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1LbGvJ1NfVJ9s4ZyKjqL1AU_oAa33kpc',
    appId: '1:257942852492:ios:553975bd35f9bf50b03ca9',
    messagingSenderId: '257942852492',
    projectId: 'rseume-dc971',
    storageBucket: 'rseume-dc971.appspot.com',
    iosBundleId: 'com.example.resumeBuilder',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1LbGvJ1NfVJ9s4ZyKjqL1AU_oAa33kpc',
    appId: '1:257942852492:ios:553975bd35f9bf50b03ca9',
    messagingSenderId: '257942852492',
    projectId: 'rseume-dc971',
    storageBucket: 'rseume-dc971.appspot.com',
    iosBundleId: 'com.example.resumeBuilder',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDfOu9oROP94SILLx8gAvDgSQEscJP8ncM',
    appId: '1:257942852492:web:3acd86928edd20b8b03ca9',
    messagingSenderId: '257942852492',
    projectId: 'rseume-dc971',
    authDomain: 'rseume-dc971.firebaseapp.com',
    storageBucket: 'rseume-dc971.appspot.com',
    measurementId: 'G-0941LSJJ93',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDW1WzH5IBKl0XRyTzf1iDgnrdG1aOTHKc',
    appId: '1:257942852492:android:e907cfd5ab4e5669b03ca9',
    messagingSenderId: '257942852492',
    projectId: 'rseume-dc971',
    storageBucket: 'rseume-dc971.appspot.com',
  );

}