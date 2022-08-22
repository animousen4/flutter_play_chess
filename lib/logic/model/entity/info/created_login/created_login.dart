import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';

part 'created_login.g.dart';

abstract class CreatedLoginEntity
    implements
        Built<CreatedLoginEntity, CreatedLoginEntityBuilder>,
        EntityInfo {
  // Fields
  String? get accessToken;
  String? get jwtToken;

  CreatedLoginEntity._();

  factory CreatedLoginEntity(
          [void Function(CreatedLoginEntityBuilder) updates]) =
      _$CreatedLoginEntity;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CreatedLoginEntity.serializer, this));
  }

  static CreatedLoginEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        CreatedLoginEntity.serializer, json.decode(jsonString))!;
  }

  static Serializer<CreatedLoginEntity> get serializer =>
      _$createdLoginEntitySerializer;
}
