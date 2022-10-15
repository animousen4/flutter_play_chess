import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/common/oops_page.dart';
import 'package:flutter_play_chess/view/routes/guard/auth_route_guard.dart';
import 'package:flutter_play_chess/view/routes/guard/debug_route_guard.dart';
import 'package:flutter_play_chess/view/routes/guard/unauthorized_route_guard.dart';
import 'package:flutter_play_chess/view/screen/debug/debug_screen.dart';
import 'package:flutter_play_chess/view/screen/debug/page/app_state_page.dart';
import 'package:flutter_play_chess/view/screen/debug/page/elements_page.dart';
import 'package:flutter_play_chess/view/screen/debug/page/requests_page.dart';
import 'package:flutter_play_chess/view/screen/home/home_screen.dart';
import 'package:flutter_play_chess/view/screen/home/page/lesson_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/play_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/profile_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/tournament_page.dart';
import 'package:flutter_play_chess/view/screen/login/login_screen.dart';
import 'package:flutter_play_chess/view/screen/login/pages/default_login.dart';
import 'package:flutter_play_chess/view/screen/photo_view/photo_view_screen.dart';
import 'package:flutter_play_chess/view/screen/sign_up/sign_up_screen.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  //replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/login", page: LoginScreen, children: [
      AutoRoute(path: "default", initial: true, page: DefaultLogin, guards: [UnauthorizedRouteGuard])
    ]),
    AutoRoute(path: "/sign_up", page: SignUpScreen, guards: [UnauthorizedRouteGuard]),
    AutoRoute(path: "/home", initial: true, page: HomeScreen, guards: [
      AuthRouteGuard
    ], children: [
      AutoRoute(path: "play", page: PlayPage),
      AutoRoute(path: "tournament", page: TournamentPage),
      AutoRoute(path: "lesson", page:  LessonPage),
      AutoRoute(path: "profile", page: ProfilePage),
    ]),
    AutoRoute(path: "/debug", page: DebugScreen, children: [
      AutoRoute(path: "elements", page: ElementsPage),
      AutoRoute(path: "app-state", page: AppStatePage),
      AutoRoute(path: "requests", initial: true ,page: RequestsPage)
    ], guards: [DebugRouteGuard]),
    AutoRoute(path: "/view", page: PhotoViewScreen),
    AutoRoute(path: "*", page: OopsPage)

  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.authRouteGuard, required super.debugRouteGuard, required super.unauthorizedRouteGuard});
}
