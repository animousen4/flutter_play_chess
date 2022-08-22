import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity_login.g.dart';

abstract class EntityLogin implements Built<EntityLogin, EntityLoginBuilder>, EntityInfo {

  String? get accessToken;
  String? get userLogin;
  String? get userPass;
  String? get appPackage;
  String? get appVersion;

  EntityLogin._();

  factory EntityLogin([void Function(EntityLoginBuilder) updates]) = _$EntityLogin;

  String toJson() {
    return json.encode(serializers.serializeWith(EntityLogin.serializer, this));
  }

  static EntityLogin fromJson(String jsonString) {
    return serializers.deserializeWith(EntityLogin.serializer, json.decode(jsonString))!;
  }

  static Serializer<EntityLogin> get serializer => _$entityLoginSerializer;
}