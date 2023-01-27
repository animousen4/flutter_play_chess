part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

abstract class _InternalEvent extends SignUpEvent {}

class _ConnectionError extends _InternalEvent {}

abstract class SignUpDataChanged extends SignUpEvent {
  final String data;

  SignUpDataChanged(this.data);
}

class TrySignUp extends SignUpEvent {}

class TryDefaultSignUp extends SignUpEvent {
  final String email;
  final String username;
  final String password;

  TryDefaultSignUp({required this.email, required this.username, required this.password});
}

