import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_play_chess/logic/exception/app_exception.dart';

class ErrorDialog extends StatelessWidget {
  final AppException error;
  const ErrorDialog({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("An error occured!"),
      content: Text(error.toString()),
    );
  }
}
