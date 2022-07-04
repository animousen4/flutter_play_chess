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
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    GoPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GoPage());
    },
    LoginScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    DefaultLoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DefaultLogin());
    },
    PlayPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlayPage());
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(GoPageRoute.name, path: '/'),
        RouteConfig(LoginScreenRoute.name, path: '/login', children: [
          RouteConfig('#redirect',
              path: '',
              parent: LoginScreenRoute.name,
              redirectTo: 'default',
              fullMatch: true),
          RouteConfig(DefaultLoginRoute.name,
              path: 'default', parent: LoginScreenRoute.name)
        ]),
        RouteConfig(HomeScreenRoute.name, path: '/home', children: [
          RouteConfig(PlayPageRoute.name,
              path: 'play', parent: HomeScreenRoute.name),
          RouteConfig(ProfilePageRoute.name,
              path: 'profile', parent: HomeScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [GoPage]
class GoPageRoute extends PageRouteInfo<void> {
  const GoPageRoute() : super(GoPageRoute.name, path: '/');

  static const String name = 'GoPageRoute';
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
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute() : super(ProfilePageRoute.name, path: 'profile');

  static const String name = 'ProfilePageRoute';
}
