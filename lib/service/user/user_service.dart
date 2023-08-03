import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/service/user/log_in_methods/via_default_user.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

const String _jwtTokenKey = "jwt_token";
const String _accessTokenKey = "access_token";

class UserService extends ChangeNotifier {
  final logger = Logger();
  String? accessToken;
  late String? jwtToken;

  late final Box<String?> storageData;

  Future<void> loadUser() async {
    storageData = await Hive.openBox<String?>("storage_data");

    accessToken = storageData.get(_accessTokenKey);
    jwtToken = storageData.get(_jwtTokenKey);
  }

  Future<void> _changeAccessToken(String? newAccessToken) async {
    await storageData.put(_accessTokenKey, newAccessToken);
    accessToken = newAccessToken;
    notifyListeners();
  }

  Future<void> changeJwtToken(String? newJwtToken) async {
    await storageData.put(_jwtTokenKey, newJwtToken);
    jwtToken = newJwtToken;
  }

  Future<void> loginViaToken(User user) async {
    await changeJwtToken(user.jwtToken);
    await _changeAccessToken(user.accessToken);
  }

  void logout() {
    _changeAccessToken(null);
    changeJwtToken(null);
  }
}
