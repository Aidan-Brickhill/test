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
    apiKey: 'AIzaSyD7_EktQQrf0rbx3yGwxm1i3VEgmLnT7Jk',
    appId: '1:554348137314:web:f09a6aa34385efe0133a3b',
    messagingSenderId: '554348137314',
    projectId: 'test-906e9',
    authDomain: 'test-906e9.firebaseapp.com',
    storageBucket: 'test-906e9.appspot.com',
    measurementId: 'G-CJFX8KJLSG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt3HlrSgH65BwC6uv3BofLf8-G63IpDW4',
    appId: '1:554348137314:android:f4df9bd576edee8c133a3b',
    messagingSenderId: '554348137314',
    projectId: 'test-906e9',
    storageBucket: 'test-906e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh4a_cB65AC3yM3N2lC4mBYIvUsroI6rU',
    appId: '1:554348137314:ios:b78f56d0b9de784b133a3b',
    messagingSenderId: '554348137314',
    projectId: 'test-906e9',
    storageBucket: 'test-906e9.appspot.com',
    iosClientId: '554348137314-chc2icshv441jqqiu3kib71tai10lkm5.apps.googleusercontent.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCh4a_cB65AC3yM3N2lC4mBYIvUsroI6rU',
    appId: '1:554348137314:ios:b78f56d0b9de784b133a3b',
    messagingSenderId: '554348137314',
    projectId: 'test-906e9',
    storageBucket: 'test-906e9.appspot.com',
    iosClientId: '554348137314-chc2icshv441jqqiu3kib71tai10lkm5.apps.googleusercontent.com',
    iosBundleId: 'com.example.test',
  );
}
