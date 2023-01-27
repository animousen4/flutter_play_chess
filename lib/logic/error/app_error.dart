import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/error/client_error.dart';
import 'package:flutter_play_chess/logic/error/server_error.dart';
import 'package:logger/logger.dart';

abstract class AppError implements Exception {
  static AppError resolve(Object error) {
    if (error is AppError) {
      return error;
    }

    if (error is DeserializationError) {
      return AppSerializationError();
    }

    return AppUnknownClientError();
  }
}
