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
      required this.unauthorizedRouteGuard,
      required this.authRouteGuard,
      required this.debugRouteGuard})
      : super(navigatorKey);

  final UnauthorizedRouteGuard unauthorizedRouteGuard;

  final AuthRouteGuard authRouteGuard;

  final DebugRouteGuard debugRouteGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: LoginScreen(key: args.key));
    },
    SignUpScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignUpScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    DebugScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DebugScreen());
    },
    PhotoViewScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoViewScreenRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PhotoViewScreen(key: args.key, tag: args.tag, img: args.img));
    },
    OopsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OopsPage());
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
    },
    RequestsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RequestsPage());
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
              path: 'default',
              parent: LoginScreenRoute.name,
              guards: [unauthorizedRouteGuard])
        ]),
        RouteConfig(SignUpScreenRoute.name,
            path: '/sign_up', guards: [unauthorizedRouteGuard]),
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
              redirectTo: 'requests',
              fullMatch: true),
          RouteConfig(ElementsPageRoute.name,
              path: 'elements', parent: DebugScreenRoute.name),
          RouteConfig(AppStatePageRoute.name,
              path: 'app-state', parent: DebugScreenRoute.name),
          RouteConfig(RequestsPageRoute.name,
              path: 'requests', parent: DebugScreenRoute.name)
        ]),
        RouteConfig(PhotoViewScreenRoute.name, path: '/view'),
        RouteConfig(OopsPageRoute.name, path: '*')
      ];
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({Key? key, List<PageRouteInfo>? children})
      : super(LoginScreenRoute.name,
            path: '/login',
            args: LoginScreenRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpScreen]
class SignUpScreenRoute extends PageRouteInfo<void> {
  const SignUpScreenRoute() : super(SignUpScreenRoute.name, path: '/sign_up');

  static const String name = 'SignUpScreenRoute';
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
/// [PhotoViewScreen]
class PhotoViewScreenRoute extends PageRouteInfo<PhotoViewScreenRouteArgs> {
  PhotoViewScreenRoute({Key? key, required String tag, required Widget img})
      : super(PhotoViewScreenRoute.name,
            path: '/view',
            args: PhotoViewScreenRouteArgs(key: key, tag: tag, img: img));

  static const String name = 'PhotoViewScreenRoute';
}

class PhotoViewScreenRouteArgs {
  const PhotoViewScreenRouteArgs(
      {this.key, required this.tag, required this.img});

  final Key? key;

  final String tag;

  final Widget img;

  @override
  String toString() {
    return 'PhotoViewScreenRouteArgs{key: $key, tag: $tag, img: $img}';
  }
}

/// generated route for
/// [OopsPage]
class OopsPageRoute extends PageRouteInfo<void> {
  const OopsPageRoute() : super(OopsPageRoute.name, path: '*');

  static const String name = 'OopsPageRoute';
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

/// generated route for
/// [RequestsPage]
class RequestsPageRoute extends PageRouteInfo<void> {
  const RequestsPageRoute() : super(RequestsPageRoute.name, path: 'requests');

  static const String name = 'RequestsPageRoute';
}
