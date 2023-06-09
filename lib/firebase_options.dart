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
    apiKey: 'AIzaSyAbYZbvYa4zpzNnxDzcbYouoMcGTiSwzIQ',
    appId: '1:306426231076:web:47ba3abbe433974e5edbb1',
    messagingSenderId: '306426231076',
    projectId: 'wal-chat',
    authDomain: 'wal-chat.firebaseapp.com',
    storageBucket: 'wal-chat.appspot.com',
    measurementId: 'G-9TPKBTEMY9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfekIe_LTJqj8eKB5-y2m82ZXfxeH5eLY',
    appId: '1:306426231076:android:21402dc4b6cd41445edbb1',
    messagingSenderId: '306426231076',
    projectId: 'wal-chat',
    storageBucket: 'wal-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_bchxeCoLNx3TVuBJuHomXqT_3yXwtxk',
    appId: '1:306426231076:ios:f70b7fae99eea4995edbb1',
    messagingSenderId: '306426231076',
    projectId: 'wal-chat',
    storageBucket: 'wal-chat.appspot.com',
    iosClientId: '306426231076-fh1m5qh0krjv35l20cf4qgjgdoritrcg.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
