import 'package:chopper/chopper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/logic/client/network_client_secured.dart';
import 'package:flutter_play_chess/service/excpetion_service/exception_service.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/guard/debug_route_guard.dart';
import 'package:flutter_play_chess/view/routes/guard/unauthorized_route_guard.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/routes/guard/auth_route_guard.dart';
import 'package:flutter_play_chess/view/theme/app_theme.dart';

class App extends StatelessWidget {
  final UserService userService;
  final NetworkClientSecured chopperClient;
  final ExceptionService exceptionService;
  
  const App({Key? key, required this.userService, required this.chopperClient, required this.exceptionService, required this.router})
      : super(key: key);

  final AppRouter router;
  //final _router = AppRouter(routeGuard: RouteGuard(userService));
  @override
  Widget build(BuildContext context) {
    //context.setLocale(Locale("en"));
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: userService),
        RepositoryProvider.value(value: chopperClient),
        RepositoryProvider.value(value: exceptionService)
      ],
      child: Builder(builder: (context) {
        return BlocProvider(
          create: (context) =>
              UserBloc(userService: context.read<UserService>()),
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            theme: AppThemeManager.darkTheme,
          ),
        );
      }),
    );

    // return RepositoryProvider.value(
    //   value: userService,
    //   child: Builder(builder: (context) {
    //     final router = AppRouter(
    //         authRouteGuard: AuthRouteGuard(context.read<UserService>()),
    //         debugRouteGuard: DebugRouteGuard());
    //     return BlocProvider(
    //       create: (context) =>
    //           UserBloc(userService: context.read<UserService>()),
    //       child: MaterialApp.router(
    //         debugShowCheckedModeBanner: false,
    //         routerDelegate: router.delegate(),
    //         routeInformationParser: router.defaultRouteParser(),
    //         theme: AppThemeManager.darkTheme,
    //       ),
    //     );
    //   }),
    // );
  }
}
