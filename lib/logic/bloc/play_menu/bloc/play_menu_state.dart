part of 'play_menu_bloc.dart';

@immutable
abstract class PlayMenuState {}

class PlayMenuLoading extends PlayMenuState {}

class PlayMenuNormal extends PlayMenuState {
  PlayMenuNormal copyWith({int? selectedRatedIndex, int? selectedCategoryIndex, int? selectedColorIndex, int? selectedTypeIndex, int? selectedOpponentIndex}) => PlayMenuNormal(
      selectedRatedIndex: selectedRatedIndex ?? this.selectedRatedIndex,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      selectedOpponentIndex: selectedOpponentIndex ?? this.selectedOpponentIndex,
      selectedTypeIndex: selectedTypeIndex ?? this.selectedTypeIndex
      );
  final int selectedRatedIndex;
  final int selectedCategoryIndex;
  final int selectedTypeIndex;
  final int selectedColorIndex;
  final int selectedOpponentIndex;

  PlayMenuNormal({required this.selectedRatedIndex, required this.selectedCategoryIndex, required this.selectedTypeIndex, required this.selectedColorIndex, required this.selectedOpponentIndex});
}

class PlayMenuError extends PlayMenuState {}
