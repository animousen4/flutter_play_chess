import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/guard/routes.dart';
import 'package:flutter_play_chess/view/routes/guard/routes_guard.dart';
import 'package:flutter_play_chess/view/theme/app_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  //final _router = AppRouter(routeGuard: RouteGuard(userService));
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserService(),
      child: Builder(builder: (context) {
        final router = AppRouter(routeGuard: RouteGuard(context.read<UserService>()));
        return BlocProvider(
          create: (context) => UserBloc(userService: context.read<UserService>()),
          child: MaterialApp.router(
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            theme: AppThemeManager.darkTheme,
          ),
        );
      }),
    );
  }
}
