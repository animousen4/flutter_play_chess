import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class DioService {
  late final Dio dio;
  final UserService userService;
  DioService({required this.userService}) {
    dio = Dio(BaseOptions(
      baseUrl: Globals.url,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) =>
          handler.next(options.copyWith(headers: {HttpHeaders.authorizationHeader : "Bearer ${userService.jwtToken}"})),
      
    ));
  }
}
