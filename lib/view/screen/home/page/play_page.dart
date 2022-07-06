import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/view/svg/svg_manager.dart';
import 'package:flutter_play_chess/view/widget/sliver/play_sliver_delegate.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  // https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverPersistentHeader(delegate: PlaySliverDelegate(expandedHeight: 270), pinned: true,)
      ],
      body: ListView(children: const [
        ListTile(title: Text("Rated game")),
      ]),
    );
  }
}
// extended_nested_scroll_view: 