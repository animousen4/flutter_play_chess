import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [SliverAppBar(title: Text("Play"),actions: [IconButton(onPressed: () {
            context.read<UserService>().logout();
          }, icon: Icon(Icons.exit_to_app))],)],
      body: ListView.builder(
        itemCount: 123,
        itemBuilder: (context, index) => Text("T:$index"),
      ),
    );
  }
}
// extended_nested_scroll_view: 