import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/svg/svg_manager.dart';
import 'package:logger/logger.dart';

class PlaySliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;
  final logger = Logger();

  PlaySliverDelegate({
    required this.expandedHeight,
    this.collapsedHeight = kToolbarHeight,
  });
  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight + 30; // +30

  double appearOnCollapse(double shrinkOffset) {
    return shrinkOffset / expandedHeight;
  }

  // open percentage
  double percentage(double shrinkOffset) => shrinkOffset / expandedHeight;

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
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: SvgIcons.notificationBell),
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("USER"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    context.read<UserService>().logout();
                                    context.popRoute();
                                  },
                                  child: Text("Log out")),
                              TextButton(
                                  onPressed: () {
                                    context.popRoute();
                                  },
                                  child: Text("Cancel"))
                            ],
                          ));
                },
                icon: SvgIcons.user);
          }),
          kDebugMode
              ? Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        context.router.push(DebugRoute());
                      },
                      icon: const Icon(Icons.adb_outlined));
                })
              : const SizedBox.shrink(),
          const SizedBox(
            width: 10,
          )
        ],
        title: Builder(builder: (context) {
          //final String username = context.read<UserInfoBloc>();
          return Container(
            constraints: const BoxConstraints(),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                    child: Opacity(
                  opacity: disappearOnCollapse(shrinkOffset) *
                      disappearOnCollapse(shrinkOffset),
                  child: BlocBuilder<UserInfoBloc, UserInfoState>(
                    builder: (context, state) {
                      if (state.username == null) {
                        return CircularProgressIndicator();
                      }
                      return Text(
                        "Welcome,\n${state.username}",
                        style: Theme.of(context).textTheme.headline2,
                      );
                    },
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

  double disappearOnCollapse(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
