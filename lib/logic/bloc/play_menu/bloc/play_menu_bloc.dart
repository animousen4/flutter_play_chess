import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_menu_event.dart';
part 'play_menu_state.dart';

class PlayMenuBloc extends Bloc<PlayMenuEvent, PlayMenuState> {
  PlayMenuBloc() : super(PlayMenuLoading()) {
    on<StartLoadData>((event, emit) {
      if (state is PlayMenuNormal) {
        emit(state);
        return;
      }

      emit(PlayMenuNormal());
    });
  }
}
