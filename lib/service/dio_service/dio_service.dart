import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/service/dio_service/error_resolver.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:logger/logger.dart';

class DioService {
  late final Dio dio;

  late final Dio tokenDio;

  final logger = Logger();

  final UserService userService;

  DioService({required this.userService}) {
    tokenDio = Dio(BaseOptions(baseUrl: Globals.url));

    dio = Dio(BaseOptions(
      baseUrl: Globals.url,
    ));

    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options
                .copyWith(headers: {
              HttpHeaders.authorizationHeader: "Bearer ${userService.jwtToken}"
            })),
        onResponse: (response, handler) {
        },
        onError: (error, handler) {
          //logger.e(error);
          handler.reject(error);
        }));
  }
}
