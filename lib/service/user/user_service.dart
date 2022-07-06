import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';

const String _currentAccountKey = "current-account";
const String _userBoxAccountsKey = "user_accounts";

class UserService {
  final BehaviorSubject<User?> currentUser = BehaviorSubject<User?>();
  late final Box<User?> userBox;

  bool get isAuthorized => currentUser.value != null;

  Future<User?> loadUser() async {
    userBox = await Hive.openBox(_userBoxAccountsKey);
    //await userBox.clear();
    currentUser.add(userBox.get(_currentAccountKey));

    return userBox.get(_currentAccountKey);
  }

  void _loginViaToken(User user) {
    userBox.put(_currentAccountKey, user);
    currentUser.add(user);
  }

  void logout() {
    userBox.put(_currentAccountKey, null);
    currentUser.add(null);
  }

  bool loginViaDefault(ViaDefaultUser defaultUser, {bool isTest = false}) {
    if (isTest) {
      _loginViaToken(User(accessToken: "testAccess", jwtToken: "testJWT"));
      return true;
    }

    // make request
    // get token
    throw UnimplementedError("Implement request to server");
  }
}
