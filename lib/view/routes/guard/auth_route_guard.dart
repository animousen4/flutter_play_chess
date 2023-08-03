import 'package:auto_route/auto_route.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:logger/logger.dart';

class AuthRouteGuard extends AutoRouteGuard {
  final UserService userService;
  final _logger = Logger();
  AuthRouteGuard(this.userService);
  
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (userService.accessToken == null) {
      router.replaceAll([LoginRoute()]);
      return;
    }

    resolver.next();
  }
}
