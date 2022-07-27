import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_list.dart';
import 'package:flutter_play_chess/view/widget/sliver/play_sliver_delegate.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  // https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
  int ratedGameIndex = 0;
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
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text("Rated game"),
          ),
          subtitle: SelectionItemList.radio(
            callback: (index) => setState(() {
              ratedGameIndex = index;
            }),
            items: [
              Text("On"),
              Text("Off"),
            ],
            selectedIndex: ratedGameIndex,
          ),
        ),
      ]),
    );
  }
}
// extended_nested_scroll_view: 