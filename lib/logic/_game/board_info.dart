import 'package:flutter/material.dart';
import 'package:flutter_play_chess/logic/player/player_info.dart';
import 'package:rxdart/subjects.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';
import 'package:bishop/bishop.dart' as bishop;

class BoardInfo {
  final List<PlayerInfo> players;
  final BehaviorSubject<SquaresState> squaresStream;
  final bishop.Game game;

  BoardInfo(
      {required this.players, required this.squaresStream, required this.game});
}
