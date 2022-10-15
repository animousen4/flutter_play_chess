import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/exception/client_exception.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';
import 'package:logger/logger.dart';

abstract class AppException implements Exception {
  static AppException resolve(Object error) {
    if (error is AppException) {
      return error;
    }

    if (error is DeserializationError) {
      return SerializationException();
    }

    return UnknownClientException();
  }
}
