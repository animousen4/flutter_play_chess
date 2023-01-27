import 'dart:math';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/view/widget/country/country_view.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';
import 'package:flutter_play_chess/view/widget/user_game_badge/user_game_badge.dart';
import 'package:squares/squares.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:bishop/bishop.dart' as bishop;
//import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart';

class PlayGameScreen extends StatefulWidget {
  const PlayGameScreen({super.key});

  @override
  State<PlayGameScreen> createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  late bishop.Game game;
  late SquaresState state;
  int player = Squares.white;
  bool aiThinking = false;
  bool flipBoard = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedScaffold(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [],
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              title: ListTile(
                title: Text(
                  "15 Classic",
                  style:
                      TextStyle(fontSize: 20.68, fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "Playing right now",
                  style: TextStyle(color: Color.fromARGB(124, 255, 255, 255)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            UserGameBadge(
                name: Text("Demiso Pomodjo"),
                rating: 2000,
                avatar: NetworkImage(
                    "https://images.anime-pictures.net/4e1/4e1f90be2af3303f330ba4f6e5b02697.jpeg"),
                countryFlag: CountryView(countryName: "eu")),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BoardController(
                state: flipBoard ? state.board.flipped() : state.board,
                playState: state.state,
                pieceSet: PieceSet.merida(),
                theme: BoardTheme.brown,
                moves: state.moves,
                onMove: _onMove,
                onPremove: _onMove,
                markerTheme: MarkerTheme(
                  empty: MarkerTheme.dot,
                  piece: MarkerTheme.corners(),
                )),
            ),
            SizedBox(
              height: 20,
            ),
            UserGameBadge(
                name: Text("Lebro"),
                rating: 2000,
                avatar: NetworkImage(
                    "https://images.anime-pictures.net/b11/b11544980df2eaf9431233d2ed95e8b3.png"),
                countryFlag: CountryView(countryName: "ru")),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                for(bishop.Move m in game.moveHistory)
                  Row(
                    children: [
                      Text(bishop.squareName(m.to), overflow: TextOverflow.fade),
                    ],
                  )
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _resetGame(false);
    super.initState();
  }

  void _onMove(Move move) async {
    bool result = game.makeSquaresMove(move);
    if (result) {
      setState(() => state = game.squaresState(player));
    }
    if (state.state == PlayState.theirTurn && !aiThinking) {
      setState(() => aiThinking = true);
      await Future.delayed(
          Duration(milliseconds: Random().nextInt(4750) + 250));
      game.makeRandomMove();
      setState(() {
        aiThinking = false;
        state = game.squaresState(player);
      });
    }
  }

  void _resetGame([bool ss = true]) {
    game = bishop.Game(variant: bishop.Variant.standard());
    state = game.squaresState(player);
    if (ss) setState(() {});
  }
}
