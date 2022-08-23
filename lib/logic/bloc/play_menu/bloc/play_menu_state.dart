part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  PlayMenuNormal copyWith({int? selectedRatedIndex, int? selectedCategoryIndex}) => PlayMenuNormal(
      selectedRatedIndex: selectedRatedIndex ?? this.selectedRatedIndex,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex);
  final int selectedRatedIndex;
  final int selectedCategoryIndex;

  PlayMenuNormal({required this.selectedRatedIndex, required this.selectedCategoryIndex});
}

class PlayMenuError extends PlayMenuState {}
