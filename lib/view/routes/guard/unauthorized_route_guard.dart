import 'package:auto_route/auto_route.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:logger/logger.dart';

class UnauthorizedRouteGuard extends AutoRouteGuard {
  final UserService userService;
  final _logger = Logger();
  UnauthorizedRouteGuard(this.userService);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    _logger.w("call onNavigation2 ${userService.accessToken}");

    if (userService.accessToken != null) {
      router.replaceAll([HomeRoute()]);
      return;
    }

    resolver.next();
  }
}
