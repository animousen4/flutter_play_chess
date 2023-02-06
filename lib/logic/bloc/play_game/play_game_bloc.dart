import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_game_event.dart';
part 'play_game_state.dart';

class PlayGameBloc extends Bloc<PlayGameEvent, PlayGameState> {
  PlayGameBloc() : super(PlayGameLoading()) {
    on<PlayGameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
