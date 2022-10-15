import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';
import 'package:built_collection/built_collection.dart';

abstract class AbstractResponse {
  ServerCode get code;
  String get message;
  String get error;
  String get version;
  EntityInfo get createdEntity;

  //String get brawlPass;

  BuiltList<ServerError> get errors;
  int get execTimeMillis;
  bool get completed;
}
