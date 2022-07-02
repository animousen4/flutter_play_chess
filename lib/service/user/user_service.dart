import 'package:flutter_play_chess/service/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';


const String _currentAccountKey = "current-account";
const String _userBoxAccountsKey = "user_accounts";

class UserService {
  final BehaviorSubject<User?> currentUser = BehaviorSubject<User?>();
  late final Box<User?> userBox;

  Future<void> loadUser() async {
    userBox = await Hive.openBox(_userBoxAccountsKey);
    currentUser.add(userBox.get(_currentAccountKey));
  }

  void logout() {
    userBox.put(_currentAccountKey, null);
    currentUser.add(null);
  }


}