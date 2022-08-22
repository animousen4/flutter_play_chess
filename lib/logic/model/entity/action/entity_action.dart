import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity_action.g.dart';

abstract class EntityAction
    implements Built<EntityAction, EntityActionBuilder> {
  // Fields

  ActionCode get actionCode;

  EntityAction._();

  factory EntityAction([void Function(EntityActionBuilder) updates]) =
      _$EntityAction;

  String toJson() {
    return json
        .encode(serializers.serializeWith(EntityAction.serializer, this));
  }

  static EntityAction fromJson(String jsonString) {
    return serializers.deserializeWith(
        EntityAction.serializer, json.decode(jsonString))!;
  }

  static Serializer<EntityAction> get serializer => _$entityActionSerializer;
}

class ActionCode extends EnumClass {
  // static const ActionCode yes = _$yes;

  static const ActionCode CREATE_ENTITY = _$CREATE_ENTITY;

  const ActionCode._(String name) : super(name);

  static BuiltSet<ActionCode> get values => _$values;
  static ActionCode valueOf(String name) => _$valueOf(name);
  static Serializer<ActionCode> get serializer => _$actionCodeSerializer;
}
