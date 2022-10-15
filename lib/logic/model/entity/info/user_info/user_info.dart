import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/request/secure/secured_options.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'user_info.g.dart';

abstract class EntityUserInfo
    implements
        Built<EntityUserInfo, EntityUserInfoBuilder>,
        EntityInfo {
  // Fields
  int? get playerKindId;
  int? get playerStatusId;
  String? get password;
  String? get userLogin;
  String? get phone;
  String? get mail;
  String? get activationDate;
  String? get firstName;
  String? get middleName;
  String? get birthDate;
  String? get genderId;
  String? get countryIso;
  int? get languageId;
  BuiltList<String>? get avatar;
  String? get email;
  bool? get isVerified;
  int? get verifyDate;
  int? get currentElo;
  bool? get newUser;

  EntityUserInfo._();

  factory EntityUserInfo([void Function(EntityUserInfoBuilder) updates]) = _$EntityUserInfo;

  String toJson() {
    return json
        .encode(serializers.serializeWith(EntityUserInfo.serializer, this));
  }

  static EntityUserInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        EntityUserInfo.serializer, json.decode(jsonString))!;
  }

  static Serializer<EntityUserInfo> get serializer => _$entityUserInfoSerializer;
}
