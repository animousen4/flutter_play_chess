part of 'safe_bloc.dart';

@immutable
abstract class SafeState {}

class LoadingState extends SafeState {}

class ReadyState extends SafeState {}

class ErrorState extends SafeState {
  final AppError exception;
  final bool reportGlobal;

  ErrorState(this.exception, {this.reportGlobal = true});
}
