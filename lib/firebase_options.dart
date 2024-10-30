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
    apiKey: 'AIzaSyDOf8QpfB_xiTm2S5KyPC0VKWHFUTIztjg',
    appId: '1:929708436752:web:4ac7aeb4c85a359af1c995',
    databaseURL: 'https://chatapp-bad60-default-rtdb.firebaseio.com/',
    messagingSenderId: '929708436752',
    projectId: 'chatapp-bad60',
    authDomain: 'chatapp-bad60.firebaseapp.com',
    storageBucket: 'chatapp-bad60.appspot.com',
    measurementId: 'G-1VDJ0SFCLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9vbzlfs2z_CGJXUPP89XKvumwxRq34dU',
    appId: '1:929708436752:android:8d6d3ce0e8196082f1c995',
    databaseURL: 'https://chatapp-bad60-default-rtdb.firebaseio.com/',
    messagingSenderId: '929708436752',
    projectId: 'chatapp-bad60',
    storageBucket: 'chatapp-bad60.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtghklfPsMSCHXM7yWLdNo9m6sCNIfspE',
    appId: '1:929708436752:ios:60dad2b38d2a3df4f1c995',
    databaseURL: 'https://chatapp-bad60-default-rtdb.firebaseio.com/',
    messagingSenderId: '929708436752',
    projectId: 'chatapp-bad60',
    storageBucket: 'chatapp-bad60.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtghklfPsMSCHXM7yWLdNo9m6sCNIfspE',
    appId: '1:929708436752:ios:60dad2b38d2a3df4f1c995',
    databaseURL: 'https://chatapp-bad60-default-rtdb.firebaseio.com/',
    messagingSenderId: '929708436752',
    projectId: 'chatapp-bad60',
    storageBucket: 'chatapp-bad60.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDOf8QpfB_xiTm2S5KyPC0VKWHFUTIztjg',
    appId: '1:929708436752:web:d2cfa4c0b7bcf058f1c995',
    databaseURL: 'https://chatapp-bad60-default-rtdb.firebaseio.com/',
    messagingSenderId: '929708436752',
    projectId: 'chatapp-bad60',
    authDomain: 'chatapp-bad60.firebaseapp.com',
    storageBucket: 'chatapp-bad60.appspot.com',
    measurementId: 'G-MK0DLHJWNB',
  );
}
