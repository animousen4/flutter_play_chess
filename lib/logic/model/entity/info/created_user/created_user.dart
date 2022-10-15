import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';

part 'created_user.g.dart';

abstract class CreatedUserEntity
    implements Built<CreatedUserEntity, CreatedUserEntityBuilder>, EntityInfo {
  // Fields

  String? get createdAccessToken; // ! mustnt be null
  int? get createdPlayerId; // !

  CreatedUserEntity._();

  factory CreatedUserEntity([void Function(CreatedUserEntityBuilder) updates]) =
      _$CreatedUserEntity;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CreatedUserEntity.serializer, this));
  }

  static CreatedUserEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        CreatedUserEntity.serializer, json.decode(jsonString))!;
  }

  static Serializer<CreatedUserEntity> get serializer =>
      _$createdUserEntitySerializer;
}
