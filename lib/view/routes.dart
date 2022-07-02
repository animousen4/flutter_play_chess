import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/screen/home/home_screen.dart';
import 'package:flutter_play_chess/view/screen/home/page/play_page.dart';
import 'package:flutter_play_chess/view/screen/home/page/profile_page.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  //replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/home", initial: true, page: HomeScreen, children: [
      AutoRoute(path: "play", page: PlayPage, initial: true),
      AutoRoute(path: "profile", page: ProfilePage)
    ]),
  ],
)
class AppRouter extends _$AppRouter{}
