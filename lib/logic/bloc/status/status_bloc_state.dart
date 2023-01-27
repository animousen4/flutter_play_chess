import 'package:flutter_play_chess/logic/bloc/status/status.dart';

abstract class StatusBlocState {
  final Status status;

  StatusBlocState(this.status);
}