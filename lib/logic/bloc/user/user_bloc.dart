import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  UserBloc({required this.userService}) : super(UserState()) {

    on<TryAutoLogIn>((event, emit) {
      userService.currentUser.listen((user) { 
        add(_UserChanged(user: user));
       });
      userService.loadUser();
    });




    on<_UserChanged>((event, emit) {
      emit(UserState(
        user: event.user
      ));
    });
  }
}
