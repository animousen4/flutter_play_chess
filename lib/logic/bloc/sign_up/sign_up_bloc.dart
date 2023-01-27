import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:flutter_play_chess/logic/error/client_error.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/user_info/user_info.dart';
import 'package:flutter_play_chess/logic/model/request/sign_up/sign_up_request.dart';
import 'package:flutter_play_chess/service/sign_up/sign_up_service.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  final SignUpService signUpService;
  final UserService userService;

  SignUpBloc({required this.signUpService, required this.userService})
      : super(SignUpInitial()) {

    on<TryDefaultSignUp>((event, emit) async {
      if (kDebugMode) {
        userService.loginViaToken(
            User(jwtToken: "testPassJwt", accessToken: "testPassAccess"));
      } else {
        var resp = await signUpService.registryDefault(SignUpRequest((r) => r
          ..version = "not defined"
          ..entityAction =
              EntityAction((act) => act..actionCode = ActionCode.CREATE_ENTITY)
                  .toBuilder()
          ..entityInfo = EntityUserInfo((i) => i
            ..email = "mail0"
            ..userLogin = "username0"
            ..password = "password0").toBuilder()));
      }
    });

    on<_ConnectionError>((event, emit) {
      emit(SignUpReady(appException: AppConnectionError()));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is SocketException) {
      add(_ConnectionError());
    }
    super.onError(error, stackTrace);
  }
}
