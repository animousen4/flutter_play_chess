import 'package:flutter/foundation.dart';

class Globals {
  static const _urlDev = "[DEV] URL";
  static const _urlProduciton = "[PROD] URL";

  static String get url => kDebugMode ? _urlDev : _urlProduciton;
}
