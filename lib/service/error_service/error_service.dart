import 'package:flutter_play_chess/view/model/view_model_error.dart';
import 'package:rxdart/rxdart.dart';

class ErrorService {
  final errorStream = BehaviorSubject<ViewModelError>();

  ErrorService();
}
