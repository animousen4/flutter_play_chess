part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {}

class PlayMenuError extends PlayMenuState {}
