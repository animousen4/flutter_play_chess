part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuEvent {}

abstract class ChangeDataEvent extends PlayMenuEvent {}

abstract class IndexedDataChanged extends ChangeDataEvent {
  final int newIndex;

  IndexedDataChanged(this.newIndex);
}

class RatedGameChanged extends IndexedDataChanged {

  RatedGameChanged(super.newIndex);
}

class CategoryGameChanged extends IndexedDataChanged {
  CategoryGameChanged(super.newIndex);

}

class ColorGameChanged extends IndexedDataChanged {
  ColorGameChanged(super.newIndex);
}

class StartLoadData extends PlayMenuEvent {}
