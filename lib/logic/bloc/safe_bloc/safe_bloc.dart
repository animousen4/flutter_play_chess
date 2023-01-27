import 'package:bloc/bloc.dart';
import 'package:flutter_play_chess/logic/bloc/stable_work_helper.dart';
import 'package:flutter_play_chess/logic/error/app_error.dart';
import 'package:flutter_play_chess/logic/error/client_error.dart';
import 'package:flutter_play_chess/logic/error/server_error.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'safe_event.dart';
part 'safe_state.dart';

abstract class SafeBloc<E, S> extends Bloc<E, S> {
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
      AppError exception, StackTrace? stackTrace, Emitter<SafeState> emit) {
    emit(ErrorState(exception));
  }

  @protected
  @override
  void onError(Object error, StackTrace stackTrace) {
    //add(_OccureError(exception: exception))
    super.onError(error, stackTrace);
  }

  AppError _resolveError(Object error) {
    // resolve errors;
    return UnknownServerError();
  }
}
