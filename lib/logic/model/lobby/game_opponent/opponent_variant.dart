import 'package:flutter_play_chess/logic/model/lobby/game_opponent/computer_difficulty.dart';

abstract class OpponentVariant {
  final String opponentName;

  OpponentVariant({required this.opponentName});
}

class OnlineOpponent extends OpponentVariant {
  OnlineOpponent({required super.opponentName});

}
class ComputerOpponent extends OpponentVariant{
  final List<ComputerDifficulty> difficultyList;
  final int selectedDifficultyIndex;

  ComputerOpponent({required this.difficultyList, required this.selectedDifficultyIndex, required super.opponentName});

}

class FriendOpponent extends OpponentVariant{
  FriendOpponent({required super.opponentName});
}