import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/app/app.dart';
import 'package:flutter_play_chess/firebase/analytics/analytics_app_service.dart';
import 'package:flutter_play_chess/firebase_options.dart';
import 'package:flutter_play_chess/logic/bloc/observer/app_bloc_observer.dart';
import 'package:flutter_play_chess/logic/client/network_client.dart';
import 'package:flutter_play_chess/logic/client/network_client_secured.dart';
import 'package:flutter_play_chess/logic/client/http_override/http_override.dart';
import 'package:flutter_play_chess/service/excpetion_service/exception_service.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'view/routes/guard/auth_route_guard.dart';
import 'view/routes/guard/debug_route_guard.dart';
import 'view/routes/guard/unauthorized_route_guard.dart';
import 'view/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final firebaseService = FirebaseAppService();
  await firebaseService.initService();

  final userService = UserService();
  await userService.loadUser();

  //final alice = Alice();

  HttpOverrides.global = DebugHttpOverride();

  final chopperClient = NetworkClientSecured(
      userService: userService, networkClient: NetworkClient());

  final exceptionService = ExceptionService();

  BlocOverrides.runZoned(
      () => runApp(
            App(
              userService: userService,
              chopperClient: chopperClient,
              exceptionService: exceptionService,
              router: AppRouter(
                  authRouteGuard: AuthRouteGuard(userService),
                  unauthorizedRouteGuard: UnauthorizedRouteGuard(userService),
                  debugRouteGuard: DebugRouteGuard()),
            ),
          ),
      blocObserver: AppBlocObserver(exceptionService));
}
