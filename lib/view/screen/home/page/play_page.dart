import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/sliver/play_sliver_delegate.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  // https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverPersistentHeader(
          delegate: PlaySliverDelegate(expandedHeight: 270),
          pinned: true,
        )
      ],
      body: ListView(children: [
        ListTile(
          title: Text("Rated game"),
          subtitle: Text("1"),
        ),

      ]),
    );
  }
}
// extended_nested_scroll_view: 