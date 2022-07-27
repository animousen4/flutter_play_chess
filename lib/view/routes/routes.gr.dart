// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey,
      required this.authRouteGuard,
      required this.debugRouteGuard})
      : super(navigatorKey);

  final AuthRouteGuard authRouteGuard;

  final DebugRouteGuard debugRouteGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    DebugScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DebugScreen());
    },
    OopsPageRoute.name: (routeData) {
      final args = routeData.argsAs<OopsPageRouteArgs>(
          orElse: () => const OopsPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: OopsPage(key: args.key, reason: args.reason));
    },
    DefaultLoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DefaultLogin());
    },
    PlayPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlayPage());
    },
    TournamentPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TournamentPage());
    },
    LessonPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LessonPage());
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    ElementsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ElementsPage());
    },
    AppStatePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppStatePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(LoginScreenRoute.name, path: '/login', children: [
          RouteConfig('#redirect',
              path: '',
              parent: LoginScreenRoute.name,
              redirectTo: 'default',
              fullMatch: true),
          RouteConfig(DefaultLoginRoute.name,
              path: 'default', parent: LoginScreenRoute.name)
        ]),
        RouteConfig(HomeScreenRoute.name, path: '/home', guards: [
          authRouteGuard
        ], children: [
          RouteConfig(PlayPageRoute.name,
              path: 'play', parent: HomeScreenRoute.name),
          RouteConfig(TournamentPageRoute.name,
              path: 'tournament', parent: HomeScreenRoute.name),
          RouteConfig(LessonPageRoute.name,
              path: 'lesson', parent: HomeScreenRoute.name),
          RouteConfig(ProfilePageRoute.name,
              path: 'profile', parent: HomeScreenRoute.name)
        ]),
        RouteConfig(DebugScreenRoute.name, path: '/debug', guards: [
          debugRouteGuard
        ], children: [
          RouteConfig('#redirect',
              path: '',
              parent: DebugScreenRoute.name,
              redirectTo: 'elements',
              fullMatch: true),
          RouteConfig(ElementsPageRoute.name,
              path: 'elements', parent: DebugScreenRoute.name),
          RouteConfig(AppStatePageRoute.name,
              path: 'app-state', parent: DebugScreenRoute.name)
        ]),
        RouteConfig(OopsPageRoute.name, path: '*')
      ];
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute({List<PageRouteInfo>? children})
      : super(LoginScreenRoute.name, path: '/login', initialChildren: children);

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [DebugScreen]
class DebugScreenRoute extends PageRouteInfo<void> {
  const DebugScreenRoute({List<PageRouteInfo>? children})
      : super(DebugScreenRoute.name, path: '/debug', initialChildren: children);

  static const String name = 'DebugScreenRoute';
}

/// generated route for
/// [OopsPage]
class OopsPageRoute extends PageRouteInfo<OopsPageRouteArgs> {
  OopsPageRoute({Key? key, Reason? reason})
      : super(OopsPageRoute.name,
            path: '*', args: OopsPageRouteArgs(key: key, reason: reason));

  static const String name = 'OopsPageRoute';
}

class OopsPageRouteArgs {
  const OopsPageRouteArgs({this.key, this.reason});

  final Key? key;

  final Reason? reason;

  @override
  String toString() {
    return 'OopsPageRouteArgs{key: $key, reason: $reason}';
  }
}

/// generated route for
/// [DefaultLogin]
class DefaultLoginRoute extends PageRouteInfo<void> {
  const DefaultLoginRoute() : super(DefaultLoginRoute.name, path: 'default');

  static const String name = 'DefaultLoginRoute';
}

/// generated route for
/// [PlayPage]
class PlayPageRoute extends PageRouteInfo<void> {
  const PlayPageRoute() : super(PlayPageRoute.name, path: 'play');

  static const String name = 'PlayPageRoute';
}

/// generated route for
/// [TournamentPage]
class TournamentPageRoute extends PageRouteInfo<void> {
  const TournamentPageRoute()
      : super(TournamentPageRoute.name, path: 'tournament');

  static const String name = 'TournamentPageRoute';
}

/// generated route for
/// [LessonPage]
class LessonPageRoute extends PageRouteInfo<void> {
  const LessonPageRoute() : super(LessonPageRoute.name, path: 'lesson');

  static const String name = 'LessonPageRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute() : super(ProfilePageRoute.name, path: 'profile');

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [ElementsPage]
class ElementsPageRoute extends PageRouteInfo<void> {
  const ElementsPageRoute() : super(ElementsPageRoute.name, path: 'elements');

  static const String name = 'ElementsPageRoute';
}

/// generated route for
/// [AppStatePage]
class AppStatePageRoute extends PageRouteInfo<void> {
  const AppStatePageRoute() : super(AppStatePageRoute.name, path: 'app-state');

  static const String name = 'AppStatePageRoute';
}
