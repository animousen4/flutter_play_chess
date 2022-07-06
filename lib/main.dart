import 'package:flutter/material.dart';
import 'package:flutter_play_chess/app/app.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final userService = UserService();
  await userService.loadUser();

  runApp(App(userService: userService));
}
