
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';
@RoutePage()
class TournamentPage extends StatelessWidget {
  const TournamentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedScaffold(
      appBar: AppBar(title: Text("Tournament"),),
    );
  }
}