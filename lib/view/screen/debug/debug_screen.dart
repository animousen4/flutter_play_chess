import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';

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
      routes: [ElementsPageRoute(), AppStatePageRoute()],
      builder: (context, content, tabController) => 
        DecoratedScaffold(
          appBar: AppBar(
            title: Text("Debug"),
            bottom: TabBar(
              tabs: [
              Text("Elements"),
              Text("App state")
            ],
            controller: tabController,),
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
