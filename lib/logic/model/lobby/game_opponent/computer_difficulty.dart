class ComputerDifficulty {
  final String eloCaption;

  ComputerDifficulty({required this.eloCaption});
}

class EasyDifficulty extends ComputerDifficulty{
  EasyDifficulty() : super(eloCaption: "gameSettings.opponent.difficulty.easy");
}

class MediumDifficulty extends ComputerDifficulty {
  MediumDifficulty() : super(eloCaption: "gameSettings.opponent.difficulty.medium");
}

class HardDifficulty extends ComputerDifficulty {
  HardDifficulty() : super(eloCaption: "gameSettings.opponent.difficulty.hard");
}