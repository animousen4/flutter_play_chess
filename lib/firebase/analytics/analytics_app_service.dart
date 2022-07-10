import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_play_chess/firebase_options.dart';
import 'package:logger/logger.dart';

class AnalyticsAppService {
  final logger = Logger();
  late bool isFirebaseFriendly;
  Future<void> initService() async {
    isFirebaseFriendly = await _initFirebase();
  }

  Future<bool> _initFirebase() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      final analytics = FirebaseAnalytics.instance;
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      logger.d("Device is firebase-friendly");
      return true;
    } catch (e) {
      logger.w("Error Firebase app initialization:\n$e");
      return false;
    }
  }
}
