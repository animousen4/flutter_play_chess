import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';
import 'package:flutter_play_chess/view/routes/guard/routes.dart';
import 'package:flutter_play_chess/view/screen/go/go_page.dart';

class GoScreen extends StatefulWidget implements AutoRouteWrapper {
  const GoScreen({Key? key}) : super(key: key);

  @override
  State<GoScreen> createState() => _GoScreenState();
  
  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserService(),
      child: Builder(builder: (context) {
        return MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(userService: context.read<UserService>()),
          ),
        ], child: this);
      }),
    );
  }
}

class _GoScreenState extends State<GoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.user == null) {
          context.pushRoute(const LoginScreenRoute());
          return;
        }
        context.pushRoute(const HomeScreenRoute());
      },
      child: Scaffold(),
    );
  }

  @override
  void initState() {
    context.read<UserBloc>().add(TryAutoLogIn());
    super.initState();
  }
}
