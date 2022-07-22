import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/country/country_view.dart';
import 'package:flutter_play_chess/view/widget/sliver/profile_badge.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverPersistentHeader(
            delegate: ProfileBadgeHeaderDelegate(
                avatar: NetworkImage(
                    "https://www.bostonmagazine.com/wp-content/uploads/sites/2/2021/08/rubber-duck-stock-t.jpg"),
                username: Text("Antonio"),
                countryFlag: CountryView(countryName: "eu"),
                rating: Text("2243 ELO")))
      ],
      body: ListView(
        children: [],
      ),
    );
  }
}
