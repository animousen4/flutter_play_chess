import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/regular_game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/game_opponent_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/online_game_opponent_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/time_type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'play_menu_event.dart';
part 'play_menu_state.dart';

class PlayMenuBloc extends Bloc<PlayMenuEvent, PlayMenuState> {
  final logger = Logger();
  PlayMenuBloc() : super(PlayMenuLoading()) {
    on<StartLoadData>((event, emit) async {
      if (state is PlayMenuNormal) {
        emit(state);
        return;
      }

      emit(PlayMenuNormal(
        isRatedGame: false,
        typeGameSetting: TimeTypeGameSetting(timePerSide: Duration(minutes: 10), name: "classic-01"),
        categoryGameSetting: RegularGameCategorySetting(),
        colorGameSetting: ColorGameSetting(color: "w"),
        opponentGameSetting: OnlineGameOpponentSetting(),
      ));
    });

    on<RatedGameChanged>((event, emit) {
      emit((state as PlayMenuNormal)
          .copyWith(isRatedGame: event.newData));
    });

    on<CategoryGameChanged>((event, emit) {
      emit((state as PlayMenuNormal)
          .copyWith(categoryGameSetting: event.newData));
    });

    on<TypeGameChanged>(
      (event, emit) {
      emit((state as PlayMenuNormal).copyWith(typeGameSetting: event.newData));
    })
    ;

    on<ColorGameChanged>((event, emit) {
      emit((state as PlayMenuNormal).copyWith(colorGameSetting: event.newData));
    });
  }
}
