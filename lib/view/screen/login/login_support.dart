import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/login/login_bloc.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

class LoginSupport extends StatelessWidget {
  const LoginSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => LoginBloc(userService: context.read<UserService>()), child: AutoRouter(),);
  }
}