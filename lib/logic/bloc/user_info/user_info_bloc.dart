import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/service/user_info/user_info_service.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoService userInfoService;
  UserInfoBloc({required this.userInfoService}) : super(UserInfoState()) {
    on<UserInfoEvent>((event, emit) async {
      emit(UserInfoState(username: await userInfoService.getUsername()));
    });
  }
}
