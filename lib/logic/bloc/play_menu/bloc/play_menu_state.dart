part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  PlayMenuNormal copyWith({int? selectedRatedIndex}) => PlayMenuNormal(
      selectedRatedIndex: selectedRatedIndex ?? this.selectedRatedIndex);
  final int selectedRatedIndex;

  PlayMenuNormal({required this.selectedRatedIndex});
}

class PlayMenuError extends PlayMenuState {}
