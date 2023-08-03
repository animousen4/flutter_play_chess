import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';

@RoutePage()
class DebugScreen extends StatefulWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [
        ElementsRoute(),
        AppStateRoute(context: context),
        RequestsRoute()
      ],
      builder: (context, content, tabController) => DecoratedScaffold(
        appBar: AppBar(
          title: Text("Debug"),
          bottom: TabBar(
            tabs: [
              Text("Elements"),
              Text("debug.appState.name").tr(),
              Text("Requests")
            ],
            controller: tabController,
          ),
        ),
        body: content,
      ),
    );
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
}
