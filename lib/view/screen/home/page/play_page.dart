import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/svg/svg_manager.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: 270,
          collapsedHeight: 60,
          flexibleSpace: SvgManager.homeBackground,
          title: const Text("Play"),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<UserBloc>().add(LogOut());
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        )
      ],
      body: ListView(children: const [
        ListTile(title: Text("Rated game")),
      ]),
    );
  }
}
// extended_nested_scroll_view: 