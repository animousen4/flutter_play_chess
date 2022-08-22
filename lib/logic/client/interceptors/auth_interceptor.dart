import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class JwtInterceptor implements RequestInterceptor {
  final UserService userService;

  JwtInterceptor({required this.userService});

  @override
  FutureOr<Request> onRequest(Request request) {
    return request.copyWith(headers: request.headers..addAll({HttpHeaders.authorizationHeader : userService.jwtToken ?? "null"}));
  }
}
