import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/logic/client/network_client.dart';
import 'package:flutter_play_chess/logic/client/network_client_secured.dart';
import 'package:flutter_play_chess/service/sign_up/sign_up_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SignUpService.create(
          context.read<NetworkClientSecured>().networkClient),
      child: Builder(builder: (context) {
        return BlocProvider(
          create: (context) => SignUpBloc(
              signUpService: context.read<SignUpService>(),
              userService: context.read<UserService>()),
          child: Builder(builder: (context) {
            return Scaffold(
                body: SafeArea(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign up"),
                TextFormField(
                  decoration: InputDecoration(hintText: "email"),
                  onChanged: (value) =>
                      context.read<SignUpBloc>().add(EmailChanged(value)),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "username"),
                  onChanged: (value) =>
                      context.read<SignUpBloc>().add(LoginChanged(value)),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "password"),
                  onChanged: (value) =>
                      context.read<SignUpBloc>().add(PasswordChanged(value)),
                ),
                Align(
                  child: ElevatedButton(
                    onPressed: () =>
                        context.read<SignUpBloc>().add(TryDefaultSignUp()),
                    child: Text("Sign up"),
                  ),
                )
              ],
            )));
          }),
        );
      }),
    );
  }
}
