import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/category_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/color_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/game_opponent_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_rating/game_rating_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_rating/rating_game_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/time_type.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_variant.dart';
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
        RatingGameSetting(
            settingName: "gameSetting.rating.settingName",
            variants: [EnabledRating(), DisabledRating()],
            selectedVariantIndexes: [0]),
        TypeGameSetting(settingName: "gameSetting.type.settingName", variants: [
          TimeType(
              name: "gameSetting.type.classic",
              timePerSideVariants: [
                Duration(minutes: 10),
                Duration(minutes: 20),
                Duration(minutes: 30)
              ],
              selectedIndex: 0),
          TypeVariant(
            name: "gameSetting.type.blitz",
          ),
        ], selectedVariantIndexes: [
          0
        ]),
        CategoryGameSetting(
            settingName: "gameSetting.category.settingName",
            variants: [
              RegularCategory(),
              OtherCategory(),
            ],
            selectedVariantIndexes: [
              0
            ]),
        ColorGameSetting(
            settingName: "gameSetting.color.settingName",
            variants: [
              ColorVariant(GColor.white),
              ColorVariant(GColor.black),
              ColorVariant(GColor.random),
            ],
            selectedVariantIndexes: [
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
