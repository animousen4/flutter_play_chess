import 'package:auto_route/auto_route.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/guard/routes.dart';
import 'package:flutter_play_chess/view/screen/login/login_screen.dart';
import 'package:logger/logger.dart';

class RouteGuard extends AutoRedirectGuard {
  final UserService userService;
  final _logger = Logger();
  RouteGuard(this.userService);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    _logger.w("call onNavigation");
    if (!userService.currentUser.hasValue) {
      await userService.loadUser();
    }

    if (userService.currentUser.value == null) {
      router.replace(const LoginScreenRoute());
      return;
    }

    resolver.next();

    // TODO: Navigate to login screen
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    _logger.w("call canNavigate");
    return Future.sync(() => userService.currentUser.value != null);
  }
}
