import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/decorated_scaffold_theme/decorated_scaffold_theme.dart';

class DecoratedScaffold extends Scaffold {
  final Decoration? decoration;
  DecoratedScaffold({
    Key? key,
    this.decoration,
    super.appBar,
    Widget? body,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
  }) : super(
            key: key,
            body: Builder(builder: (context) {
              final theme =
                  Theme.of(context).extension<DecoratedScaffoldTheme>()!;
              return Container(
                decoration: decoration ?? theme.decoration,
                constraints: BoxConstraints(minHeight: double.infinity, minWidth: double.infinity),
                child: body,
              );
            }));
}
