part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class _UserChanged extends UserEvent{
  final User? user;

  _UserChanged({this.user});
}

class LogOut extends UserEvent {}

class TryAutoLogIn extends UserEvent {}
