import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get platformOptions {
    // Android
    return const FirebaseOptions(
      apiKey:
          'BI1AUNyVNQ-rG8AMzDTT-l6QrKFx4jpQFElCpOFDrLcpGOGjuFmPwZxHlnkdu_-xlA4J1AIXB7-hiwece0IN0BQ',
      appId: '1:36177826260:android:81719c932296988099c641',
      messagingSenderId: '36177826260',
      projectId: 'qnbfinansbank-45b13',
    );
    // if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   // return const FirebaseOptions(
    //   //   apiKey: 'AIzaSyBE9O3AxYbCUJ5a-3C3PYSeh0EIDYoFr10',
    //   //   appId: '1:307053445102:android:bde45a9d5da1e308c8d8ff',
    //   //   messagingSenderId: '307053445102',
    //   //   projectId: 'water-tracker-cfabf',
    //   // );
    // } else

    //   // Android
    //   return const FirebaseOptions(
    //     apiKey: 'AIzaSyBE9O3AxYbCUJ5a-3C3PYSeh0EIDYoFr10',
    //     appId: '1:307053445102:android:bde45a9d5da1e308c8d8ff',
    //     messagingSenderId: '307053445102',
    //     projectId: 'water-tracker-cfabf',
    //   );
  }
}
