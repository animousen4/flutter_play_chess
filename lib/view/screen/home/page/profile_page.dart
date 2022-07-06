import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverAppBar(
          title: Text("Profile"),
        )
      ],
      body: ListView(
        children: const [Text("profile")],
      ),
    );
  }
}
