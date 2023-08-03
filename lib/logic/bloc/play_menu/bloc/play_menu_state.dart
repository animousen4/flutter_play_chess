part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  final bool validated;
  final bool isPlaying;

  final RatingGameSetting ratingGameSetting;
  final TypeGameSetting typeGameSetting;
  final CategoryGameSetting categoryGameSetting;
  final ColorGameSetting colorGameSetting;
  final OpponentGameSetting opponentGameSetting;

  // PlayMenuNormal modifyGameSetting(GameSetting gameSetting) {
  //   int index = 0;

  //   for (GameSetting g in gameSettings) {
  //     if (g.runtimeType == (gameSetting.runtimeType)) {
  //       gameSettings[index] = gameSetting;
  //     }
  //     index++;
  //   }

  //   return PlayMenuNormal(
  //       gameSettings: gameSettings,
  //       isSearching: isSearching,
  //       playAllowed: playAllowed,
  //       isPlaying: isPlaying,
  //       gameFound: gameFound);
  // }

  PlayMenuNormal copyWith({
          final RatingGameSetting? ratingGameSetting,
          final TypeGameSetting? typeGameSetting,
          final CategoryGameSetting? categoryGameSetting,
          final ColorGameSetting? colorGameSetting,
          final OpponentGameSetting? opponentGameSetting,
          bool? isSearching,
          bool? isPlaying,
          bool? validated,
          bool? gameFound}) =>
      PlayMenuNormal(
          ratingGameSetting: ratingGameSetting ?? this.ratingGameSetting,
          typeGameSetting: typeGameSetting ?? this.typeGameSetting,
          categoryGameSetting: categoryGameSetting ?? this.categoryGameSetting,
          colorGameSetting: colorGameSetting ?? this.colorGameSetting,
          opponentGameSetting: opponentGameSetting ?? this.opponentGameSetting,
          validated: validated ?? this.validated,
          isPlaying: isPlaying ?? this.isPlaying);

  PlayMenuNormal({
    required this.ratingGameSetting,
    required this.typeGameSetting,
    required this.categoryGameSetting,
    required this.colorGameSetting,
    required this.opponentGameSetting,
    this.isPlaying = false,
    required this.validated,
  });
}
