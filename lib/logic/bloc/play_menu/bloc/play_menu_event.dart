part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuEvent {}

abstract class ChangeDataEvent extends PlayMenuEvent {}

class RatedGameChanged extends ChangeDataEvent {
  final int newIndex;

  RatedGameChanged(this.newIndex);
}

class StartLoadData extends PlayMenuEvent {}
