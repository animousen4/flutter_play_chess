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
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final firebaseService = FirebaseAppService();
  await firebaseService.initService();

  final userService = UserService();
  await userService.loadUser();

  HttpOverrides.global = DebugHttpOverride();

  final chopperClient = NetworkClientSecured(
      userService: userService, networkClient: NetworkClient());

  BlocOverrides.runZoned(
      () => runApp(EasyLocalization(
            supportedLocales: [Locale("en")],
            path: "assets/localization",
            fallbackLocale: Locale("en"),
            child: App(
              userService: userService,
              chopperClient: chopperClient,
            ),
          )),
      blocObserver: AppBlocObserver());
}
