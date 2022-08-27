import 'package:flutter/foundation.dart';

class Globals {
  static const _urlDev = "https://10.0.2.2";//"https://smartsafeschool.com";//"https://172.17.0.1:1443";
  static const _urlProduciton = "[PROD] URL";

  static const bool autoDebugRedirect = false;

  static String get url => kDebugMode ? _urlDev : _urlProduciton;
}
