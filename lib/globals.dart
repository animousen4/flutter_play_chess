import 'package:flutter/foundation.dart';

class Globals {
  static const _urlDev = "https://172.17.0.1:1443";
  static const _urlProduciton = "[PROD] URL";

  static String get url => kDebugMode ? _urlDev : _urlProduciton;
}
