import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

const String _jwtTokenKey = "jwt_token";
const String _accessTokenKey = "access_token";

class UserService {
  final logger = Logger();
  late final BehaviorSubject<String?> accessToken;
  late String? jwtToken;

  late final Box<String?> storageData;

  Future<void> loadUser() async {
    storageData = await Hive.openBox<String?>("storage_data");

    accessToken = BehaviorSubject.seeded(storageData.get(_accessTokenKey));
    jwtToken = storageData.get(_jwtTokenKey);
  }

  void _changeAccessToken(String? newAccessToken) {
    storageData.put(_accessTokenKey, newAccessToken);
    accessToken.add(newAccessToken);
  }

  void changeJwtToken(String? newJwtToken) {
    storageData.put(_jwtTokenKey, newJwtToken);
    jwtToken = newJwtToken;
  }

  void _loginViaToken(User user) {
    _changeAccessToken(user.accessToken);
    changeJwtToken(user.jwtToken);
  }

  void logout() {
    _changeAccessToken(null);
    changeJwtToken(null);
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
