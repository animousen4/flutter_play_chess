import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
part 'log_in_request.g.dart';

abstract class LogInRequest
    implements Built<LogInRequest, LogInRequestBuilder>, AbstractRequest {
  // Fields

  @override
  EntityLogin get entityInfo;

  LogInRequest._();

  factory LogInRequest([void Function(LogInRequestBuilder) updates]) =
      _$LogInRequest;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LogInRequest.serializer, this));
  }

  static LogInRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        LogInRequest.serializer, json.decode(jsonString))!;
  }

  static Serializer<LogInRequest> get serializer => _$logInRequestSerializer;
}
