import 'dart:async';

import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:flutter_play_chess/logic/error/server_error.dart';

class StableWorkHelper {
  final FutureOr<void> Function() unsafeActions;
  final FutureOr<void> Function(AppError appException) onFailure;

  StableWorkHelper({required this.unsafeActions, required this.onFailure}) {
    try {
      unsafeActions.call();
    } catch (e) {
      onFailure.call(GeneralServerError());
    }
  }

  void checkCode(int code) {}
}
