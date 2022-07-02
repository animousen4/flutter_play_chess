import 'package:flutter_play_chess/service/user/user.dart';
import 'package:rxdart/subjects.dart';

class UserService {
  late final BehaviorSubject<User?> currentUser;

  UserService() {
    currentUser = BehaviorSubject<User?>();
  }
}