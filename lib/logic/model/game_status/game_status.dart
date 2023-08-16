class GameStatus {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

class SearchingStatus extends GameStatus {}

class FoundGameStatus extends GameStatus {}

class ConfirmedGameStatus extends GameStatus {}

class PlayingGameStatus extends GameStatus {
  final int id;

  PlayingGameStatus(this.id);

  @override
  String toString() {
    return "Playing game with id $id";
  }
}
