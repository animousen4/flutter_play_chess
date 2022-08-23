import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/logic/client/chopper_client.dart';
import 'package:flutter_play_chess/service/user_info/user_info_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/svg/svg_manager.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayMenuBloc(),
        ),
        BlocProvider(create: (context) => UserInfoBloc(userInfoService: context.read<AppClient>().getService<UserInfoService>()))
      ],
      child: AutoTabsRouter(
          routes: const [
            PlayPageRoute(),
            TournamentPageRoute(),
            LessonPageRoute(),
            ProfilePageRoute()
          ],
          builder: (context, page, controller) => DecoratedScaffold(
                body: page,
                bottomNavigationBar: NavigationBar(
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
                ),
              )),
    );
  }

  @override
  void initState() {
    if (kDebugMode && Globals.autoDebugRedirect) {
      context.pushRoute(DebugScreenRoute());
    }
    super.initState();
  }
}
