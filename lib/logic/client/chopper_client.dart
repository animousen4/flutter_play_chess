import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/logic/client/app_authenticator.dart';
import 'package:flutter_play_chess/logic/client/converter.dart';
import 'package:flutter_play_chess/logic/client/http_override/http_override.dart';
import 'package:flutter_play_chess/logic/client/interceptors/auth_interceptor.dart';
import 'package:flutter_play_chess/logic/client/interceptors/log_interceptor.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/service/user_info/user_info_service.dart';

class AppClient extends ChopperClient {
  final UserService userService;
  AppClient({required this.userService})
      : super(baseUrl: Globals.url, converter: DataConverter(), interceptors: [
          //JwtInterceptor(userService: userService),
          LogInterceptor()
        ],
          authenticator: AppAuthenticator(userService: userService),
         services: [
          LogInService.create(),
          UserInfoService.create()
        ]);
}
