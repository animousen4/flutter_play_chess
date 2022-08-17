import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  UserBloc({required this.userService}) : super(UserState(isReady: false)) {
    userService.accessToken.listen((value) {
      add(_UserChanged(accessToken: value, jwtToken: userService.jwtToken));
    });

    on<LogOut>((event, emit) {
      userService.logout();
    });


    on<_UserChanged>((event, emit) {
      emit(UserState(accessToken: event.accessToken, jwtToken: event.jwtToken));
    });
  }
}
