import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/logic/bloc/game_status/game_status_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/logic/client/network_client_secured.dart';
import 'package:flutter_play_chess/service/game_status_service/game_status_service.dart';
import 'package:flutter_play_chess/service/user_info/user_info_service.dart';
import 'package:flutter_play_chess/view/responsive/responsive_helper.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/svg/svg_manager.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GameStatusService()..initGameService(),
        ),
      ],
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PlayMenuBloc(),
            ),
            BlocProvider(
                create: (context) => UserInfoBloc(
                    userInfoService: context
                        .read<NetworkClientSecured>()
                        .getService<UserInfoService>())),
            BlocProvider(
                create: (context) => GameStatusBloc(
                    gameStatusService: context.read<GameStatusService>()))
          ],
          child: AutoTabsRouter(
              routes: const [
                PlayRoute(),
                TournamentRoute(),
                LessonRoute(),
                ProfileRoute()
              ],
              builder: (context, page) => LayoutBuilder(
                    builder: (context, constraints) =>
                        BlocBuilder<GameStatusBloc, GameStatusState>(
                      builder: (context, gameStatusState) {
                        return DecoratedScaffold(
                          body: context.read<ResponsiveHelper>().isDesktop
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    navigationRail(context),
                                    Expanded(child: page)
                                  ],
                                )
                              : page,
                          bottomSheet: gameStatusState.gameStatus == null
                              ? null
                              : BottomSheet(
                                  onClosing: () {},
                                  builder: (context) =>
                                      Text("${gameStatusState.gameStatus}")),
                          bottomNavigationBar:
                              context.read<ResponsiveHelper>().isDesktop
                                  ? null
                                  : navigationBar(context),
                        );
                      },
                    ),
                  )),
        );
      }),
    );
  }

  Widget navigationRail(BuildContext context) => NavigationRail(
        selectedIndex: context.tabsRouter.activeIndex,
        onDestinationSelected: context.tabsRouter.setActiveIndex,
        destinations: [
          NavigationRailDestination(
              icon: SvgIcons.playIconNotActive,
              selectedIcon: SvgIcons.playIconActive,
              label: Text("Play")),
          NavigationRailDestination(
              icon: SvgIcons.trophyIconNotActive,
              selectedIcon: SvgIcons.trophyIconActive,
              label: Text("Tournaments")),
          NavigationRailDestination(
              icon: SvgIcons.lessonIconNotActive,
              selectedIcon: SvgIcons.lessonIconActive,
              label: Text("Lesson")),
          NavigationRailDestination(
              icon: SvgIcons.profileIconNotActive,
              selectedIcon: SvgIcons.profileIconActive,
              label: Text("Profile")),
        ],
      );
  Widget navigationBar(BuildContext context) => NavigationBar(
        selectedIndex: context.tabsRouter.activeIndex,
        onDestinationSelected: context.tabsRouter.setActiveIndex,
        destinations: [
          NavigationDestination(
              icon: SvgIcons.playIconNotActive,
              selectedIcon: SvgIcons.playIconActive,
              label: "Play"),
          NavigationDestination(
              icon: SvgIcons.trophyIconNotActive,
              selectedIcon: SvgIcons.trophyIconActive,
              label: "Tournaments"),
          NavigationDestination(
              icon: SvgIcons.lessonIconNotActive,
              selectedIcon: SvgIcons.lessonIconActive,
              label: "Lessons"),
          NavigationDestination(
              icon: SvgIcons.profileIconNotActive,
              selectedIcon: SvgIcons.profileIconActive,
              label: "Profile"),
        ],
      );

  @override
  void initState() {
    if (kDebugMode && Globals.autoDebugRedirect) {
      context.pushRoute(DebugRoute());
    }
    super.initState();
  }
}
