import 'package:flutter_play_chess/logic/exception/app_exception.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';

abstract class ServerException extends AppException {
  final String? message;

  ServerException({this.message});

  static ServerException resolveException(ServerCode error) {
    switch (error) {
      case ServerCode.OC_GENERAL_ERROR:
        return GeneralServerException();
      default:
        return UnknownServerException();
    }
  }
}

class GeneralServerException extends ServerException {}

class UnknownServerException extends ServerException {
  
}
