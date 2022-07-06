import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.builder(
        routes: const [PlayPageRoute(), ProfilePageRoute()],
        builder: (context, pages, controller) => DecoratedScaffold(
              body: pages[context.tabsRouter.activeIndex],
              bottomNavigationBar: NavigationBar(
                selectedIndex: context.tabsRouter.activeIndex,
                onDestinationSelected: context.tabsRouter.setActiveIndex,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.play_arrow), label: "Play"),
                  NavigationDestination(
                      icon: Icon(Icons.verified_user), label: "Profile")
                ],
              ),
            ));
  }

  @override
  void initState() {
    //context.read<UserBloc>().add(TryAutoLogIn());
    super.initState();
  }
}
