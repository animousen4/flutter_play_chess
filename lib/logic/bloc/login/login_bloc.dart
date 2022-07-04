import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService userService;
  LoginBloc({required this.userService}) : super(LoginInitial()) {
    on<LogIn>((event, emit) {
      //userService.currentUser.add(User(accessToken: "accessTokenTesT", jwtToken: "jwtTeST"));
      userService.loginViaDefault(
          ViaDefaultUser(username: "test-us", password: "test-psw"),
          isTest: true);
    });
  }
}
