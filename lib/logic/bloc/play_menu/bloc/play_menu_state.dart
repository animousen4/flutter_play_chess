part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {

  PlayMenuNormal modifyGameSetting(GameSetting gameSetting) {
    int index = 0;
    for (GameSetting g in gameSettings) {
      if (g.runtimeType == (gameSetting.runtimeType)) {
        gameSettings[index] = gameSetting;
      }
      index++;
    }

    return PlayMenuNormal(gameSettings: gameSettings);
  }

  final List<GameSetting> gameSettings;


  PlayMenuNormal(
      {required this.gameSettings});
}

class PlayMenuError extends PlayMenuState {}
