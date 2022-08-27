import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final logger = Logger();
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.w("Bloc Observer caught an error!\nbloc: $bloc\nerror: $error");
  }
}
