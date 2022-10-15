import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
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

  double percentage(double currentHeight) => currentHeight / expandedHeight;

  @override
  Widget build(BuildContext context, currentHeight, isTramTam) {
    return AppBar(
      flexibleSpace: Opacity(
        opacity: 1 - percentage(currentHeight), //visibility
        child: Center(
          child: ListTile(
            title: username,
            subtitle: Row(
              children: [
                countryFlag,
                SizedBox(
                  width: 10,
                ),
                rating
              ],
            ),
            leading: GestureDetector(
              onTap: () => context.pushRoute(PhotoViewScreenRoute(tag: "local-view", img: Image(image: avatar,))),
              child: Hero(
                tag: "local-view",
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  backgroundImage: avatar,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
