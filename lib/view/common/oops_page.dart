import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/logic/error/reason/reason.dart';

class OopsPage extends StatelessWidget {
  final Reason? reason;
  const OopsPage({Key? key, this.reason}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: reason == null ? Text("Oops, something went wrong") : reason is NotFoundReason ? Text("This page doesn't exists") : Text("zzzzz"),
      ),
    );
  }
}