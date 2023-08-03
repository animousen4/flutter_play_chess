import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/logic/client/network_client.dart';
import 'package:flutter_play_chess/logic/client/network_client_secured.dart';
import 'package:flutter_play_chess/logic/error/client_error.dart';
import 'package:flutter_play_chess/service/sign_up/sign_up_service.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String email = "";
  late String username = "";
  late String password = "";
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
                body: BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SignUpReady) {
                  if (state.appException is AppConnectionError) {
                    showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                              title: Text("Connection Exception"),
                              content: Text("Please, try again later"),
                            ));
                  }
                }
              },
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up"),
                  TextFormField(
                    decoration: InputDecoration(hintText: "email"),
                    onChanged: (value) => email = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "username"),
                    onChanged: (value) =>
                        username = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "password"),
                    onChanged: (value) =>
                        password = value,
                  ),
                  Align(
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<SignUpBloc>().add(TryDefaultSignUp(email: email, username: username, password: password)),
                      child: Text("Sign up"),
                    ),
                  )
                ],
              )),
            ));
          }),
        );
      }),
    );
  }
}
