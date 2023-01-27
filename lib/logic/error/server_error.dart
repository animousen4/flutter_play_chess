import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';

abstract class ServerError extends AppError {
  final String? message;

  ServerError({this.message});

  static ServerError resolveError(ServerCode error) {
    switch (error) {
      case ServerCode.OC_GENERAL_ERROR:
        return GeneralServerError();
      default:
        return UnknownServerError();
    }
  }
}

class GeneralServerError extends ServerError {}

class UnknownServerError extends ServerError {}
