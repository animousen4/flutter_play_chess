import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:meta/meta.dart';

part 'debug_event.dart';
part 'debug_state.dart';

class DebugBloc extends Bloc<DebugEvent, DebugState> {
  DebugBloc() : super(DebugState()) {
    on<DebugEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
