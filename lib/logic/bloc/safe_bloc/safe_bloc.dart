import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/bloc/stable_work_helper.dart';
import 'package:flutter_play_chess/logic/exception/app_exception.dart';
import 'package:flutter_play_chess/logic/exception/client_exception.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'safe_event.dart';
part 'safe_state.dart';

abstract class SafeBloc<E, S>
    extends Bloc<E, S> {
  final logger = Logger();

  final exceptionStream = BehaviorSubject<Object>();

  SafeBloc(S initial) : super(initial) {
    StableWorkHelper(
        unsafeActions: () => on<E>((event, emit) {}),
        onFailure: (e) {
          addError(e);
        });
    
  }

  void onErrorOccured(
      AppException exception, StackTrace? stackTrace, Emitter<SafeState> emit) {
    emit(ErrorState(exception));
  }

  @protected
  @override
  void onError(Object error, StackTrace stackTrace) {
    //add(_OccureError(exception: exception))
    super.onError(error, stackTrace);
  }

  AppException _resolveError(Object error) {
    // resolve errors;
    return UnknownServerException();
  }
}
