import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:rxdart/rxdart.dart';

class ExceptionService {
  final exceptionStream = BehaviorSubject<AppError>();

  ExceptionService();
}
