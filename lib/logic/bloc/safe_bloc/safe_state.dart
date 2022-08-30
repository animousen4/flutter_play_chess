part of 'safe_bloc.dart';

@immutable
abstract class SafeState {}

class LoadingState extends SafeState {}

class ReadyState extends SafeState {}

class ErrorState extends SafeState {
  final AppException exception;
  final bool reportGlobal;

  ErrorState(this.exception, {this.reportGlobal = true});
}
