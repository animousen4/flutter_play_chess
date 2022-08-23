import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/client/network_client.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/model/request/log_in_request.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:logger/logger.dart';

class AppAuthenticator extends Authenticator {
  final UserService userService;

  final NetworkClient networkClient;

  final logger = Logger();

  AppAuthenticator({required this.userService, required this.networkClient});
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      try {
        var response = await networkClient
            .getService<LogInService>()
            .loginDefault(LogInRequest((r) => r
              ..version = "0.0.0"
              ..entityAction =
                  EntityAction((a) => a..actionCode = ActionCode.CREATE_ENTITY)
                      .toBuilder()
              ..entityInfo = EntityLogin(
                      (i) => i..accessToken = userService.accessToken.value)
                  .toBuilder()));
        if (response.isSuccessful) {
          final newJwtToken = response.body!.createdEntity.jwtToken;
          userService.changeJwtToken(newJwtToken);
          return request.copyWith(
              headers: request.headers
                ..addAll({
                  HttpHeaders.authorizationHeader:
                      userService.jwtToken ?? "null"
                }));
        }
      } on Exception catch (e, s) {
        logger.e(e);
        return null;
      }
    }
  }
}
