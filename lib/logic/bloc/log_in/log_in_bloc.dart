import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final UserService userService;
  LogInBloc({required this.userService})
      : super(LogInState(formStatus: FormStatus.initial)) {
    on<LogInDefault>((event, emit) {
      userService.loginViaDefault(ViaDefaultUser(username: event.username, password: event.password), isTest: true);
    });
  }
}
