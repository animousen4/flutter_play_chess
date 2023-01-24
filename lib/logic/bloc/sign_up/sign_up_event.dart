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

class TryDefaultSignUp extends SignUpEvent {}

class LoginChanged extends SignUpDataChanged {
  LoginChanged(super.data);
}

class PasswordChanged extends SignUpDataChanged {
  PasswordChanged(super.data);
}

class EmailChanged extends SignUpDataChanged {
  EmailChanged(super.data);
}
