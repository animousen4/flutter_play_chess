// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    OopsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OopsPage(),
      );
    },
    DebugRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DebugScreen(),
      );
    },
    AppStateRoute.name: (routeData) {
      final args = routeData.argsAs<AppStateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppStatePage(
          key: args.key,
          context: args.context,
        ),
      );
    },
    ElementsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ElementsPage(),
      );
    },
    RequestsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RequestsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LessonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LessonPage(),
      );
    },
    PlayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlayPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    TournamentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TournamentPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    DefaultLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefaultLoginPage(),
      );
    },
    PhotoViewRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhotoViewScreen(
          key: args.key,
          tag: args.tag,
          img: args.img,
        ),
      );
    },
    PlayGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlayGameScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
  };
}

/// generated route for
/// [OopsPage]
class OopsRoute extends PageRouteInfo<void> {
  const OopsRoute({List<PageRouteInfo>? children})
      : super(
          OopsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OopsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DebugScreen]
class DebugRoute extends PageRouteInfo<void> {
  const DebugRoute({List<PageRouteInfo>? children})
      : super(
          DebugRoute.name,
          initialChildren: children,
        );

  static const String name = 'DebugRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppStatePage]
class AppStateRoute extends PageRouteInfo<AppStateRouteArgs> {
  AppStateRoute({
    Key? key,
    required BuildContext context,
    List<PageRouteInfo>? children,
  }) : super(
          AppStateRoute.name,
          args: AppStateRouteArgs(
            key: key,
            context: context,
          ),
          initialChildren: children,
        );

  static const String name = 'AppStateRoute';

  static const PageInfo<AppStateRouteArgs> page =
      PageInfo<AppStateRouteArgs>(name);
}

class AppStateRouteArgs {
  const AppStateRouteArgs({
    this.key,
    required this.context,
  });

  final Key? key;

  final BuildContext context;

  @override
  String toString() {
    return 'AppStateRouteArgs{key: $key, context: $context}';
  }
}

/// generated route for
/// [ElementsPage]
class ElementsRoute extends PageRouteInfo<void> {
  const ElementsRoute({List<PageRouteInfo>? children})
      : super(
          ElementsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElementsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RequestsPage]
class RequestsRoute extends PageRouteInfo<void> {
  const RequestsRoute({List<PageRouteInfo>? children})
      : super(
          RequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LessonPage]
class LessonRoute extends PageRouteInfo<void> {
  const LessonRoute({List<PageRouteInfo>? children})
      : super(
          LessonRoute.name,
          initialChildren: children,
        );

  static const String name = 'LessonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlayPage]
class PlayRoute extends PageRouteInfo<void> {
  const PlayRoute({List<PageRouteInfo>? children})
      : super(
          PlayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TournamentPage]
class TournamentRoute extends PageRouteInfo<void> {
  const TournamentRoute({List<PageRouteInfo>? children})
      : super(
          TournamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'TournamentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DefaultLoginPage]
class DefaultLoginRoute extends PageRouteInfo<void> {
  const DefaultLoginRoute({List<PageRouteInfo>? children})
      : super(
          DefaultLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'DefaultLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhotoViewScreen]
class PhotoViewRoute extends PageRouteInfo<PhotoViewRouteArgs> {
  PhotoViewRoute({
    Key? key,
    required String tag,
    required Widget img,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoViewRoute.name,
          args: PhotoViewRouteArgs(
            key: key,
            tag: tag,
            img: img,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoViewRoute';

  static const PageInfo<PhotoViewRouteArgs> page =
      PageInfo<PhotoViewRouteArgs>(name);
}

class PhotoViewRouteArgs {
  const PhotoViewRouteArgs({
    this.key,
    required this.tag,
    required this.img,
  });

  final Key? key;

  final String tag;

  final Widget img;

  @override
  String toString() {
    return 'PhotoViewRouteArgs{key: $key, tag: $tag, img: $img}';
  }
}

/// generated route for
/// [PlayGameScreen]
class PlayGameRoute extends PageRouteInfo<void> {
  const PlayGameRoute({List<PageRouteInfo>? children})
      : super(
          PlayGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
