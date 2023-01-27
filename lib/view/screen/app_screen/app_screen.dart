import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:flutter_play_chess/service/excpetion_service/exception_service.dart';

abstract class AppScreen extends StatefulWidget {
  //final ExceptionService? exceptionService;
  AppScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) => widget.build(context);

  void onError(AppError exception) {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              title: Text("ERROR"),
              content: Text("$exception"),
            ));
  }

  @override
  void initState() {
    context.read<ExceptionService>().exceptionStream.listen((value) {
      onError(value);
    });
    super.initState();
  }
}
