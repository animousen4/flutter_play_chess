import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/logic/client/auth/app_authenticator.dart';
import 'package:flutter_play_chess/logic/client/converter/converter.dart';
import 'package:flutter_play_chess/logic/client/http_override/http_override.dart';
import 'package:flutter_play_chess/logic/client/interceptors/auth_interceptor.dart';
import 'package:flutter_play_chess/logic/client/interceptors/log_interceptor.dart';
import 'package:flutter_play_chess/logic/client/interceptors/server_exception_interceptor.dart';
import 'package:flutter_play_chess/logic/client/network_client.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/service/user_info/user_info_service.dart';

class NetworkClientSecured extends ChopperClient {
  final UserService userService;
  final NetworkClient networkClient;
  NetworkClientSecured({required this.userService, required this.networkClient})
      : super(
            baseUrl: Uri.parse(Globals.url),
            converter: DataConverter(),
            interceptors: [
              //JwtInterceptor(userService: userService),
              LogInterceptor(),
              ServerExceptionInterceptor()
            ],
            authenticator: AppAuthenticator(userService: userService, networkClient: networkClient),
            services: [UserInfoService.create()]);
}
