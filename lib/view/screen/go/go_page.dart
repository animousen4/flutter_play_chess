import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes.dart';

class GoPage extends StatefulWidget {
  const GoPage({Key? key}) : super(key: key);

  @override
  State<GoPage> createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.user == null) {
          context.router.replace(const LoginScreenRoute());
          return;
        }
        context.router.replace(const HomeScreenRoute());
      },
      child: const Center(child: Text("LOGO")),
    );
  }

  @override
  void initState() {
    context.read<UserBloc>().add(TryAutoLogIn());
    //context.read<UserService>().loadUser();
    super.initState();
  }
}
