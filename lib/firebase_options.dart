import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      // Add other platforms if needed
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  //
  // !!! IMPORTANT !!!
  // You must replace the placeholder text below with the real values
  // from your 'android/app/google-services.json' file.
  //
   static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCST1ypke58BqaLN9PjrjCMNTsiXY6li_a",
    appId: "1:576075217602:android:0276f8151d3c084fac195b",
    messagingSenderId: "576075217602",
    projectId: "tipsy-app-6a705",
    storageBucket: "tipsy-app-6a705.firebasestorage.app",
  );
}