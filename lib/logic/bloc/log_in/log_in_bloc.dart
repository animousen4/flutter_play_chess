import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/bloc/safe_bloc/safe_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/status/status.dart';
import 'package:flutter_play_chess/logic/bloc/status/status_bloc_state.dart';
import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:flutter_play_chess/logic/error/server_error.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/model/request/log_in/log_in_request.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final UserService userService;

  final LogInService logInService;

  LogInBloc({required this.userService, required this.logInService})
      : super(LogInState(Status.initial())) {
    on<_ErrorOccured>((event, emit) {
      emit(LogInState(Status.error(event.appError)));
    });
    on<LogInDefault>((event, emit) async {
      emit(LogInState(Status.submitting()));
      // var resp = await logInService.loginDefault(LogInRequest((r) => r
      //   ..version = "not defined"
      //   ..entityAction =
      //       EntityAction((act) => act..actionCode = ActionCode.CREATE_ENTITY)
      //           .toBuilder()
      //   ..entityInfo = EntityLogin((login) => login
      //     ..accessToken = null
      //     ..appPackage = "not defined"
      //     ..appVersion = "0.0.0"
      //     ..userLogin = event.username
      //     ..userPass = event.password).toBuilder()));

      //!!!!!!!!!!!!!!

      await Future.delayed(Duration(milliseconds: 500));
      await userService
          .loginViaToken(User(accessToken: "TESTACCESS", jwtToken: "TESTJWT"));

      emit(LogInState(Status.submissionSuccess()));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(_ErrorOccured(AppError.resolve(error)));
    super.onError(error, stackTrace);
  }
}
