import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/game_opponent_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/time_type.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_variant.dart';
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

      add(GameSettingLoaded([
        TypeGameSetting(settingName: "type-setting", variants: [
          TimeType(
              name: "classic-01",
              timePerSideVariants: [
                Duration(minutes: 10),
                Duration(minutes: 20),
                Duration(minutes: 30)
              ],
              selectedIndex: 0),
          TimeType(
              name: "blitz-01",
              timePerSideVariants: [
                Duration(minutes: 1),
                Duration(minutes: 2),
                Duration(minutes: 3)
              ],
              selectedIndex: 0)
        ], selectedVariantIndexes: [
          0
        ])
      ]));
    });

    on<GameSettingModified>((event, emit) {
      emit((state as PlayMenuNormal).modifyGameSetting(event.gameSetting));
    });
    on<GameSettingsModified>((event, emit) {
      emit(PlayMenuNormal(gameSettings: event.gameSettings));
    });
    on<GameSettingLoaded>((event, emit) {
      emit(PlayMenuNormal(gameSettings: event.gameSettings));
    });
  }
}
