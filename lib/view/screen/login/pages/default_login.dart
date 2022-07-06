import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/login/login_bloc.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';

class DefaultLogin extends StatelessWidget {
  const DefaultLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess ?? false) {
            context.router.replace(const HomeScreenRoute());
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              const Text("Default login"),
              TextButton(
                  onPressed: () {
                    context
                        .read<LoginBloc>()
                        .add(LogIn(username: "us111", password: "pass222"));
                  },
                  child: const Text('Log in [debug]'))
            ],
          ),
        ),
      ),
    );
  }
}
