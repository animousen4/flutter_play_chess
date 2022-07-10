import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/app/app.dart';
import 'package:flutter_play_chess/firebase/analytics/analytics_app_service.dart';
import 'package:flutter_play_chess/firebase_options.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final analyticsService = AnalyticsAppService();
  await analyticsService.initService();

  final userService = UserService();
  await userService.loadUser();

  runApp(App(userService: userService));
}
