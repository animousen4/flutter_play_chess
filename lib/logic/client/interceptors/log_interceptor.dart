import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';

class LogInterceptor implements RequestInterceptor, ResponseInterceptor {
  final logger = Logger();
  @override
  FutureOr<Request> onRequest(Request request) {
    logger.d(
        "REQUEST [${request.method}]\nurl: ${request.url}\nheaders: ${request.headers}\nbody: ${request.body}");
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    logger.d("RESPONSE [CODE: ${response.statusCode}]\nbody: ${response.body}");
    return response;
  }
}
