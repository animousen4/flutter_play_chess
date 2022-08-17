part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent {}

abstract class AbstractLogIn extends LogInEvent {}

class LogInDefault extends AbstractLogIn {
  final String username;
  final String password;

  LogInDefault({required this.username, required this.password});
}
