part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  PlayMenuNormal copyWith(
          {bool? isRatedGame,
  TypeGameSetting? typeGameSetting,
  CategoryGameSetting? categoryGameSetting,
  ColorGameSetting? colorGameSetting,
  OpponentGameSetting? opponentGameSetting}) =>
      PlayMenuNormal(
        isRatedGame: isRatedGame ?? this.isRatedGame,
        typeGameSetting: typeGameSetting ?? this.typeGameSetting,
        categoryGameSetting: categoryGameSetting ?? this.categoryGameSetting,
        colorGameSetting: colorGameSetting ?? this.colorGameSetting,
        opponentGameSetting: opponentGameSetting ?? this.opponentGameSetting
      );

  final bool isRatedGame;
  final TypeGameSetting typeGameSetting;
  final CategoryGameSetting categoryGameSetting;
  final ColorGameSetting colorGameSetting;
  final OpponentGameSetting opponentGameSetting;


  PlayMenuNormal(
      {required this.isRatedGame,
      required this.typeGameSetting,
      required this.categoryGameSetting,
      required this.colorGameSetting,
      required this.opponentGameSetting});
}

class PlayMenuError extends PlayMenuState {}
