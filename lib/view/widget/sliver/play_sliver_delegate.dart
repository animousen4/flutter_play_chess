import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/svg/svg_manager.dart';
import 'package:logger/logger.dart';

class PlaySliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;
  final Duration appearDuration;
  final logger = Logger();

  PlaySliverDelegate(
      {required this.expandedHeight,
      this.collapsedHeight = kToolbarHeight,
      this.appearDuration = const Duration(milliseconds: 100)});
  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight + 30; // +30

  double appearOnCollapse(double shrinkOffset) {
    return shrinkOffset / expandedHeight;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Container(
        //   color: const Color.fromARGB(255, 2, 32, 75),
        // ),
        buildBackground(shrinkOffset),
        buildCleverAppBar(shrinkOffset),
        //buildDisappearingAppBar(shrinkOffset)
      ],
    );
  }

  // Opacity(
  //       opacity: appear(shrinkOffset),
  //       child: AppBar(
  //         title: Text("GG"),
  //       ),
  //     );

  Widget buildBackground(double shrinkOffset) {
    return SvgMaterial.homeBackground;
    
  }

  Widget buildCleverAppBar(double shrinkOffset) => AppBar(
        toolbarHeight: 120,
        titleSpacing: 16,
        actions: [
          IconButton(onPressed: () {}, icon: SvgIcons.notificationBell),
          IconButton(onPressed: () {}, icon: SvgIcons.user),
          const SizedBox(
            width: 10,
          )
        ],
        title: Builder(builder: (context) {
          return Container(
            constraints: const BoxConstraints(),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                    child: Opacity(
                  opacity: disappearOnCollapse(shrinkOffset) *
                      disappearOnCollapse(shrinkOffset),
                  child: Text(
                    "Welcome,\nUSERNAME",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
                Positioned(
                  child: Opacity(
                    opacity: appearOnCollapse(shrinkOffset) *
                        appearOnCollapse(shrinkOffset),
                    child: Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 0.4,
                      child: SvgIcons.logo,
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      );

  Widget buildDisappearingAppBar(double shrinkOffset) => AnimatedOpacity(
        opacity: appearOnCollapse(shrinkOffset),
        duration: const Duration(milliseconds: 300),
        child: AppBar(
          shadowColor: Colors.transparent,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          title: const Text("GGGGG"),
        ),
      );

  double disappearOnCollapse(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}