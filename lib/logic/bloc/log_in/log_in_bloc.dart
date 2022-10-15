import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/bloc/safe_bloc/safe_bloc.dart';
import 'package:flutter_play_chess/logic/exception/app_exception.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';
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
      : super(LogInLoading()) {
    on<_ErrorOccured>((event, emit) {
      emit(LogInError(event.appException));
    });
    on<LogInDefault>((event, emit) async {
      var resp = await logInService.loginDefault(LogInRequest((r) => r
        ..version = "not defined"
        ..entityAction =
            EntityAction((act) => act..actionCode = ActionCode.CREATE_ENTITY)
                .toBuilder()
        ..entityInfo = EntityLogin((login) => login
          ..accessToken = null
          ..appPackage = "not defined"
          ..appVersion = "0.0.0"
          ..userLogin = event.username
          ..userPass = event.password).toBuilder()));

      emit(LogInReady());
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(_ErrorOccured(AppException.resolve(error)));
    super.onError(error, stackTrace);
  }
}
