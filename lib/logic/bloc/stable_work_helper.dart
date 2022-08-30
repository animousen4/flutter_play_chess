import 'dart:async';

import 'package:flutter_play_chess/logic/exception/app_exception.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';

class StableWorkHelper {
  final FutureOr<void> Function() unsafeActions;
  final FutureOr<void> Function(AppException appException) onFailure;

  StableWorkHelper({required this.unsafeActions, required this.onFailure}) {
    try {
      unsafeActions.call();
    } catch (e) {
      onFailure.call(GeneralServerException());
    }
  }

  void checkCode(int code) {}
}
