import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';

part 'server_error.g.dart';

abstract class ServerError implements Built<ServerError, ServerErrorBuilder> {
  // Fields

  String get error;
  String get field;
  String get errorMsg;

  ServerError._();

  factory ServerError([void Function(ServerErrorBuilder) updates]) =
      _$ServerError;

  String toJson() {
    return json.encode(serializers.serializeWith(ServerError.serializer, this));
  }

  static ServerError fromJson(String jsonString) {
    return serializers.deserializeWith(
        ServerError.serializer, json.decode(jsonString))!;
  }

  static Serializer<ServerError> get serializer => _$serverErrorSerializer;
}
