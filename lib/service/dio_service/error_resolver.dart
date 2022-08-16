import 'package:dio/dio.dart';
import 'package:flutter_play_chess/service/dio_service/error_list.dart';

class ErrorResolver {
  Response response;

  ErrorResolver(this.response);

  NetworkError? resolveInternal() {

  }

  NetworkError? resolveExternal() {
    switch (response.statusCode) {
      case 401:
        return TokenExpiredError();

      case 403:
        return RightError();

      case 404:
        return NotFoundError();

      default:
        return null;
    }
  }
}
