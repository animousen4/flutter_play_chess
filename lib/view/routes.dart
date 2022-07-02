import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/screen/go/go_page.dart';
import 'package:flutter_play_chess/view/screen/go/go_screen.dart';
import 'package:flutter_play_chess/view/screen/home/home_screen.dart';
import 'package:flutter_play_chess/view/screen/home/page/play_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/profile_page.dart';
import 'package:flutter_play_chess/view/screen/login/login_screen.dart';
import 'package:flutter_play_chess/view/screen/login/login_support.dart';
import 'package:flutter_play_chess/view/screen/login/pages/default_login.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  //replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", initial: true, page: GoScreen, children: [
      AutoRoute(path: "login", page: LoginScreen, children: [
        AutoRoute(path: "default", initial: true, page: DefaultLogin)
      ]),
      AutoRoute(path: "home", page: HomeScreen, children: [
        AutoRoute(path: "play", page: PlayPage),
        AutoRoute(path: "profile", page: ProfilePage)
      ]),
    ]),
  ],
)
class AppRouter extends _$AppRouter {}
