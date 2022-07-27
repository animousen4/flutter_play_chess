import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/logic/error/reason/reason.dart';
import 'package:flutter_play_chess/view/common/oops_page.dart';
import 'package:flutter_play_chess/view/routes/guard/auth_route_guard.dart';
import 'package:flutter_play_chess/view/routes/guard/debug_route_guard.dart';
import 'package:flutter_play_chess/view/screen/debug/debug_screen.dart';
import 'package:flutter_play_chess/view/screen/debug/page/app_state_page.dart';
import 'package:flutter_play_chess/view/screen/debug/page/elements_page.dart';
import 'package:flutter_play_chess/view/screen/home/home_screen.dart';
import 'package:flutter_play_chess/view/screen/home/page/lesson_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/play_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/profile_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/tournament_page.dart';
import 'package:flutter_play_chess/view/screen/login/login_screen.dart';
import 'package:flutter_play_chess/view/screen/login/pages/default_login.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  //replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/login", page: LoginScreen, children: [
      AutoRoute(path: "default", initial: true, page: DefaultLogin)
    ]),
    AutoRoute(path: "/home", page: HomeScreen, guards: [
      AuthRouteGuard
    ], children: [
      AutoRoute(path: "play", page: PlayPage),
      AutoRoute(path: "tournament", page: TournamentPage),
      AutoRoute(path: "lesson", page:  LessonPage),
      AutoRoute(path: "profile", page: ProfilePage),
    ]),
    AutoRoute(path: "/debug", initial: true, page: DebugScreen, children: [
      AutoRoute(path: "elements", initial: true, page: ElementsPage),
      AutoRoute(path: "app-state", page: AppStatePage)
    ], guards: [DebugRouteGuard]),

    AutoRoute(path: "*", page: OopsPage)

  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.authRouteGuard, required super.debugRouteGuard});
}
