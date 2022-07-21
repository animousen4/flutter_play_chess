import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

class ProfileBadgeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final ImageProvider<Object> avatar;
  final Widget username;
  final Widget countryFlag;
  final Widget rating;
  final double expandedHeight;
  final double collapsedHeight;
  const ProfileBadgeHeaderDelegate(
      {Key? key,
      required this.avatar,
      required this.username,
      required this.countryFlag,
      required this.rating,
      this.expandedHeight = 162,
      this.collapsedHeight = 162})
      : super();

  @override
  Widget build(BuildContext context, expValue, isTramTam) {
    return AppBar(
      flexibleSpace: Center(
        child: ListTile(
          title: username,
          subtitle: Row(
            children: [
              countryFlag, SizedBox(width: 10,), rating
            ],
          ),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            backgroundImage: avatar,
          ),
        ),
      ),
    );
  }

  double percentageExpansion(double expValue) => expValue / expandedHeight;

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }
}
