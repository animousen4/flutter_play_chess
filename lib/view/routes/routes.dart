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

import '../screen/app_screen/app_screen.dart';
import '../screen/play/play_game_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final UserService userService;

  AppRouter(this.userService);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/home", initial: true, page: HomeRoute.page, guards: [
          AuthRouteGuard(userService)
        ], children: [
          AutoRoute(path: "play", page: PlayRoute.page),
          AutoRoute(path: "tournament", page: TournamentRoute.page),
          AutoRoute(path: "lesson", page: LessonRoute.page),
          AutoRoute(path: "profile", page: ProfileRoute.page),
        ]),
        AutoRoute(path: "/login", page: LoginRoute.page, guards: [
          UnauthorizedRouteGuard(userService)
        ], children: [
          AutoRoute(
            path: "default",
            initial: true,
            page: DefaultLoginRoute.page,
          )
        ]),
        AutoRoute(
            path: "/sign_up",
            page: SignUpRoute.page,
            guards: [UnauthorizedRouteGuard(userService)]),
        AutoRoute(path: "/playgame", page: PlayGameRoute.page),
        AutoRoute(path: "/debug", page: DebugRoute.page, children: [
          AutoRoute(path: "elements", page: ElementsRoute.page),
          AutoRoute(path: "app-state", page: AppStateRoute.page),
          AutoRoute(path: "requests", initial: true, page: RequestsRoute.page)
        ], guards: [
          DebugRouteGuard()
        ]),
        AutoRoute(path: "/view", page: PhotoViewRoute.page),
        AutoRoute(path: "*", page: OopsRoute.page)
      ];
}
