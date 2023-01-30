part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuEvent {}

abstract class ChangeDataEvent extends PlayMenuEvent {}

abstract class IndexedDataChanged<T> extends ChangeDataEvent {
  final T newData;

  IndexedDataChanged(this.newData);
}

class RatedGameChanged extends IndexedDataChanged<bool> {
  RatedGameChanged(super.newData);
}

class CategoryGameChanged extends IndexedDataChanged<CategoryGameSetting> {
  CategoryGameChanged(super.newData);
}

class TypeGameChanged extends IndexedDataChanged<TypeGameSetting> {
  TypeGameChanged(super.newData);
}

class ColorGameChanged extends IndexedDataChanged<ColorGameSetting> {
  ColorGameChanged(super.newData);
}

class StartLoadData extends PlayMenuEvent {}
