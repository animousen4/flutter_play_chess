import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:logger/logger.dart';

class DebugRouteGuard extends AutoRouteGuard {
  final _logger = Logger();
  DebugRouteGuard() {}
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    _logger.w("call onNavigation");
    if (kDebugMode) {
      resolver.next();
      return;
    }

    router.popAndPush(OopsRoute());
  }
}
