import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_play_chess/logic/error/app_error.dart';

class ErrorDialog extends StatelessWidget {
  final AppError? error;
  const ErrorDialog({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("An error occured!"),
      content: Text(error.toString()),
    );
  }
}
