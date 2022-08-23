import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class AppAuthenticator extends Authenticator {
  final UserService userService;

  AppAuthenticator({required this.userService});
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    return request.copyWith(headers: request.headers..addAll({HttpHeaders.authorizationHeader : userService.jwtToken ?? "null"}));
  }
}
