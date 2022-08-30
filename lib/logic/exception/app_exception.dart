import 'package:flutter_play_chess/logic/exception/client_exception.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';

abstract class AppException implements Exception {
  static AppException resolve(Object error) {
    switch (error.runtimeType) {
      default:
        return UnknownClientException();
    }
  }
}
