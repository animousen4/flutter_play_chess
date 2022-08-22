import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/log_in/log_in_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            LogInBloc(userService: context.read<UserService>(), logInService: context.read<LogInService>()),
        child: Builder(
          builder: (context) {
            return const AutoRouter();
          }
        ),
      )
    ;
  }
}
