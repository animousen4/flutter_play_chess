import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/log_in/log_in_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(userService: context.read<UserService>()),
      child: RequestsPageView(),
    );
  }
}

class RequestsPageView extends StatefulWidget {
  const RequestsPageView({Key? key}) : super(key: key);

  @override
  State<RequestsPageView> createState() => _RequestsPageViewState();
}

class _RequestsPageViewState extends State<RequestsPageView> {
  bool canLogIn = false;
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            title: Padding(
              padding: const EdgeInsets.only(
                bottom: 5
              ),
              child: Text("Log in request"),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (data) {
                    username = data;
                    validateLogIn();
                  },
                  decoration:
                      InputDecoration(hintText: "chess_player@gmail.com"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "•••••••••"),
                  onChanged: (data) {
                    password = data;
                    validateLogIn();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: canLogIn
                        ? () => context.read<LogInBloc>().add(LogInDefault(
                            username: username, password: password))
                        : null,
                    child: Text("Log in"),
                  ),
                )
              ],
            ))
      ],
    );
  }

  void validateLogIn() {
    setState(() {
      canLogIn = username.isNotEmpty && password.isNotEmpty;
    });
  }
}
