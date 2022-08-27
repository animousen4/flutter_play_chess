import 'package:flutter_play_chess/logic/exception/app_exception.dart';
import 'package:rxdart/rxdart.dart';

class ExceptionService {
  final exceptionStream = BehaviorSubject<AppException>();
  
  ExceptionService();
}
