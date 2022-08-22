import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/abstract_response.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
part 'log_in_response.g.dart';

abstract class LogInResponse
    implements Built<LogInResponse, LogInResponseBuilder>, AbstractResponse {
  // Fields

  @override
  EntityLogin get createdEntity;

  LogInResponse._();

  factory LogInResponse([void Function(LogInResponseBuilder) updates]) =
      _$LogInResponse;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LogInResponse.serializer, this));
  }

  static LogInResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        LogInResponse.serializer, json.decode(jsonString))!;
  }

  static Serializer<LogInResponse> get serializer => _$logInResponseSerializer;
}
