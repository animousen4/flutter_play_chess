import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:logger/logger.dart';
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

      emit(PlayMenuNormal(selectedRatedIndex: 0));
    });

    on<RatedGameChanged>((event, emit) {
      emit((state as PlayMenuNormal).copyWith(selectedRatedIndex: event.newIndex));
    });
  }
}
