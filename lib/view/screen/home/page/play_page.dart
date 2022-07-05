import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [const SliverAppBar(title: Text("Play"))],
      body: ListView.builder(
        itemCount: 123,
        itemBuilder: (context, index) => Text("T:$index"),
      ),
    );
  }
}
// extended_nested_scroll_view: 