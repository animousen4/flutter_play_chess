part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  final bool isSearching;
  final bool playAllowed;
  final bool isPlaying;
  PlayMenuNormal modifyGameSetting(GameSetting gameSetting) {
    int index = 0;

    for (GameSetting g in gameSettings) {
      if (g.runtimeType == (gameSetting.runtimeType)) {
        gameSettings[index] = gameSetting;
      }
      index++;
    }

    return PlayMenuNormal(
        gameSettings: gameSettings,
        isSearching: isSearching,
        playAllowed: playAllowed,
        isPlaying: isPlaying);
  }

  final List<GameSetting> gameSettings;

  PlayMenuNormal copyWith(
          {List<GameSetting>? gameSettings,
          bool? isSearching,
          bool? isPlaying,
          bool? playAllowed}) =>
      PlayMenuNormal(
          gameSettings: gameSettings ?? this.gameSettings,
          playAllowed: playAllowed ?? this.playAllowed,
          isSearching: isSearching ?? this.isSearching,
          isPlaying: isPlaying ?? this.isPlaying);

  PlayMenuNormal(
      {required this.gameSettings,
      this.isSearching = false,
      this.isPlaying = false,
      required this.playAllowed,
      });
}
