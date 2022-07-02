import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
        routes: const [PlayPageRoute(), ProfilePageRoute()],
        builder: (context, child, controller) => Scaffold(
              appBar: AppBar(
                title: Text(context.topRoute.name),
              ),
              body: child,
              bottomNavigationBar: NavigationBar(
                selectedIndex: context.tabsRouter.activeIndex,
                onDestinationSelected: context.tabsRouter.setActiveIndex,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.play_arrow), label: "Play"),
                  
                  NavigationDestination(icon: Icon(Icons.verified_user), label: "Profile")
                ],
              ),
            ));
  }
}
