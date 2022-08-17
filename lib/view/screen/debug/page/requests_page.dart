import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  bool canLogIn = false;
  String login = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final userService = context.read<UserService>();
    return ListView(
      children: [
        ListTile(
            title: Text("Log in request"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (data) {
                    login = data;
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
                    onPressed: canLogIn ? () {} : null,
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
      canLogIn = login.isNotEmpty && password.isNotEmpty;
    });
  }
}
