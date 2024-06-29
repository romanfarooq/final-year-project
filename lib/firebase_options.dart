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
    apiKey: 'AIzaSyDYY7ky0z3_0df1BRrrsbVvakQKYdTNIcM',
    appId: '1:812183513091:web:163dda80a38b352a21c636',
    messagingSenderId: '812183513091',
    projectId: 'carcarepro-a0193',
    authDomain: 'carcarepro-a0193.firebaseapp.com',
    storageBucket: 'carcarepro-a0193.appspot.com',
    measurementId: 'G-SDLFFZNV0Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGFN1uk2BOF_LDwLrj_UM5cDTUK3WRJQE',
    appId: '1:812183513091:android:78cde19eca971d5621c636',
    messagingSenderId: '812183513091',
    projectId: 'carcarepro-a0193',
    storageBucket: 'carcarepro-a0193.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADSFrozcNVBxHiHhsCQXmqHRmPXmvo40o',
    appId: '1:812183513091:ios:3b0d267f99cd807021c636',
    messagingSenderId: '812183513091',
    projectId: 'carcarepro-a0193',
    storageBucket: 'carcarepro-a0193.appspot.com',
    iosBundleId: 'com.example.carCare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADSFrozcNVBxHiHhsCQXmqHRmPXmvo40o',
    appId: '1:812183513091:ios:9b55822394f86b8721c636',
    messagingSenderId: '812183513091',
    projectId: 'carcarepro-a0193',
    storageBucket: 'carcarepro-a0193.appspot.com',
    iosBundleId: 'com.example.carcarepro',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYY7ky0z3_0df1BRrrsbVvakQKYdTNIcM',
    appId: '1:812183513091:web:7eb689d672db7afb21c636',
    messagingSenderId: '812183513091',
    projectId: 'carcarepro-a0193',
    authDomain: 'carcarepro-a0193.firebaseapp.com',
    storageBucket: 'carcarepro-a0193.appspot.com',
    measurementId: 'G-FS6MJBN6ES',
  );
}