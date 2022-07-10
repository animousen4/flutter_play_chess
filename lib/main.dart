import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/app/app.dart';
import 'package:flutter_play_chess/firebase_options.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final userService = UserService();
  await userService.loadUser();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    logger.e("Error Firebase app initialization:\n$e");
  }

  runApp(App(userService: userService));
}
