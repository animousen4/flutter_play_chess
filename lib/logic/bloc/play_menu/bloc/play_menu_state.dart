part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  final bool isSearching;
  final bool playAllowed;
  final bool isPlaying;
  final bool gameFound;
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
        isPlaying: isPlaying,
        gameFound: gameFound);
  }

  final List<GameSetting> gameSettings;

  PlayMenuNormal copyWith(
          {List<GameSetting>? gameSettings,
          bool? isSearching,
          bool? isPlaying,
          bool? playAllowed,
          bool? gameFound}) =>
      PlayMenuNormal(
          gameSettings: gameSettings ?? this.gameSettings,
          playAllowed: playAllowed ?? this.playAllowed,
          isSearching: isSearching ?? this.isSearching,
          isPlaying: isPlaying ?? this.isPlaying,
          gameFound: gameFound ?? this.gameFound);

  PlayMenuNormal({
    required this.gameSettings,
    this.isSearching = false,
    this.isPlaying = false,
    this.gameFound = false,
    required this.playAllowed,
  });
}
