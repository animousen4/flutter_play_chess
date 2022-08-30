part of 'log_in_bloc.dart';

abstract class LogInState {}

class LogInReady extends LogInState {}

class LogInLoading extends LogInState {}

class LogInError extends LogInState {
  final AppException appException;

  LogInError(this.appException);
}
