import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';
import 'package:flutter_play_chess/service/excpetion_service/exception_service.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final logger = Logger();
  final ExceptionService exceptionService;

  AppBlocObserver(this.exceptionService);
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.w("Bloc Observer caught an error!\nbloc: $bloc\nerror: $error");
    exceptionService.exceptionStream.add(GeneralServerException());
  }
}
