import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
  String username = "";
  String password = "";
  String email = "";

  final SignUpService signUpService;
  final UserService userService;

  SignUpBloc({required this.signUpService, required this.userService})
      : super(SignUpInitial()) {
    on<LoginChanged>((event, emit) {
      username = event.data;
    });

    on<PasswordChanged>((event, emit) {
      password = event.data;
    });

    on<EmailChanged>((event, emit) {
      email = event.data;
    });

    on<TryDefaultSignUp>((event, emit) async {
      if (kDebugMode)
        userService.loginViaToken(
            User(jwtToken: "testPassJwt", accessToken: "testPassAccess"));
      var resp = await signUpService.registryDefault(SignUpRequest((r) => r
        ..version = "not defined"
        ..entityAction =
            EntityAction((act) => act..actionCode = ActionCode.CREATE_ENTITY)
                .toBuilder()
        ..entityInfo = EntityUserInfo((i) => i
          ..email = "mail0"
          ..userLogin = "username0"
          ..password = "password0").toBuilder()));
    });
  }
}
