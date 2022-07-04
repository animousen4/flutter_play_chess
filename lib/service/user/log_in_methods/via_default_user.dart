import 'package:flutter_play_chess/service/user/log_in_methods/via_abstract_user.dart';

class ViaDefaultUser extends ViaAbstractUser {
  final String username;
  final String password;

  ViaDefaultUser({required this.username, required this.password});
}