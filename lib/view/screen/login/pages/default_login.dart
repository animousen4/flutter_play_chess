import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/log_in/log_in_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/safe_bloc/safe_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/status/status.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/widget/dialog/error/error_dialog.dart';

class DefaultLogin extends StatelessWidget {
  const DefaultLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) async {
          if (state.status is SubmissionSuccess) {
            await context.router.pop();
            context.router.replace(const HomeScreenRoute());
          } else if (state.status is SubmittingStatus) {
            showDialog(context: context, builder: (context) => AlertDialog(title: Text("Loading"), content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),), barrierDismissible: false);

          }
          
          else if (state.status is ErrorStatus) {
            await context.router.pop();
            showDialog(
                context: context,
                builder: (context) => ErrorDialog(error: (state.status as ErrorStatus).error));
          }
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Default login"),
              TextButton(
                  onPressed: () {
                    context.read<LogInBloc>().add(
                        LogInDefault(username: "us111", password: "pass222"));
                  },
                  child: const Text('Log in [debug]')),
              TextButton(
                  onPressed: () {
                    context.pushRoute(SignUpScreenRoute());
                  },
                  child: Text("Go to sign up"))
            ],
          ),
        ),
      ),
    );
  }
}
