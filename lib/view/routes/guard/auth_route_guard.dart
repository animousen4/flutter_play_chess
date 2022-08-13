import 'package:auto_route/auto_route.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:logger/logger.dart';

class AuthRouteGuard extends AutoRedirectGuard {
  final UserService userService;
  final _logger = Logger();
  AuthRouteGuard(this.userService) {
    userService.accessToken.listen((value) { 
      if (value == null) {
        reevaluate();
      }
     });
  }
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    _logger.w("call onNavigation");

    if (userService.accessToken.value == null) {
      router.popAndPush(const LoginScreenRoute());
      return;
    }

    resolver.next();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    _logger.w("call canNavigate");
    return Future.sync(() => userService.accessToken.value != null);
  }
}
