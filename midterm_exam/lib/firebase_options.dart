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
    apiKey: 'AIzaSyAjnvJqz1GvHhVSNx5ViP7KTMCk2zPHdWE',
    appId: '1:759224187012:web:1ee5c951afe8fb2a37ead1',
    messagingSenderId: '759224187012',
    projectId: 'midtermflutter-956f4',
    authDomain: 'midtermflutter-956f4.firebaseapp.com',
    databaseURL: 'https://midtermflutter-956f4-default-rtdb.firebaseio.com',
    storageBucket: 'midtermflutter-956f4.firebasestorage.app',
    measurementId: 'G-KDZNZQCVVJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUDiTRfvOh2atvrnRMaj8IDhyrEIKCTWs',
    appId: '1:759224187012:android:c944b6d4b83ce91337ead1',
    messagingSenderId: '759224187012',
    projectId: 'midtermflutter-956f4',
    databaseURL: 'https://midtermflutter-956f4-default-rtdb.firebaseio.com',
    storageBucket: 'midtermflutter-956f4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsMSfE3nvqAg5snTizlcyHnaJ5qwjqhP4',
    appId: '1:759224187012:ios:dc2a92725b2083c537ead1',
    messagingSenderId: '759224187012',
    projectId: 'midtermflutter-956f4',
    databaseURL: 'https://midtermflutter-956f4-default-rtdb.firebaseio.com',
    storageBucket: 'midtermflutter-956f4.firebasestorage.app',
    iosClientId: '759224187012-01j54puhf6qalsjg4ouutg5i0cojf7qb.apps.googleusercontent.com',
    iosBundleId: 'com.example.midtermExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsMSfE3nvqAg5snTizlcyHnaJ5qwjqhP4',
    appId: '1:759224187012:ios:dc2a92725b2083c537ead1',
    messagingSenderId: '759224187012',
    projectId: 'midtermflutter-956f4',
    databaseURL: 'https://midtermflutter-956f4-default-rtdb.firebaseio.com',
    storageBucket: 'midtermflutter-956f4.firebasestorage.app',
    iosClientId: '759224187012-01j54puhf6qalsjg4ouutg5i0cojf7qb.apps.googleusercontent.com',
    iosBundleId: 'com.example.midtermExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjnvJqz1GvHhVSNx5ViP7KTMCk2zPHdWE',
    appId: '1:759224187012:web:9d40a353735a4eed37ead1',
    messagingSenderId: '759224187012',
    projectId: 'midtermflutter-956f4',
    authDomain: 'midtermflutter-956f4.firebaseapp.com',
    databaseURL: 'https://midtermflutter-956f4-default-rtdb.firebaseio.com',
    storageBucket: 'midtermflutter-956f4.firebasestorage.app',
    measurementId: 'G-H405ZZFWWX',
  );
}
