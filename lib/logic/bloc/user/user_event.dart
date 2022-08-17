part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class _UserChanged extends UserEvent {
  final String? accessToken;
  final String? jwtToken;

  _UserChanged({this.accessToken, this.jwtToken});
}



class LogOut extends UserEvent {}
