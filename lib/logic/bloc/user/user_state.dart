part of 'user_bloc.dart';

class UserState {
  final String? accessToken;
  final String? jwtToken;
  final bool isReady;

  bool get isAuthorized => jwtToken != null && accessToken != null;

  UserState({this.accessToken, this.jwtToken, this.isReady = true});
}
