import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/model/game_status/game_status.dart';
import 'package:flutter_play_chess/service/game_status_service/game_status_service.dart';
import 'package:meta/meta.dart';

part 'game_status_event.dart';
part 'game_status_state.dart';

class GameStatusBloc extends Bloc<GameStatusEvent, GameStatusState> {
  final GameStatusService gameStatusService;

  GameStatusBloc({required this.gameStatusService}) : super(GameStatusState()) {
    gameStatusService.gameStatus.listen((value) {
      add(_GameStatusChanged(newStatus: value));
    });

    on<_GameStatusChanged>((event, emit) {
      emit(GameStatusState(gameStatus: event.newStatus));
    });
  }
}
