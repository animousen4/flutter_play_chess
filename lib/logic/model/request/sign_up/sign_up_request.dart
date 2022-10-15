import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/entity/info/user_info/user_info.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';

part 'sign_up_request.g.dart';

abstract class SignUpRequest
    implements Built<SignUpRequest, SignUpRequestBuilder>, AbstractRequest {
  // Fields

  @override
  EntityUserInfo get entityInfo;

  SignUpRequest._();

  factory SignUpRequest([void Function(SignUpRequestBuilder) updates]) =
      _$SignUpRequest;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SignUpRequest.serializer, this));
  }

  static SignUpRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        SignUpRequest.serializer, json.decode(jsonString))!;
  }

  static Serializer<SignUpRequest> get serializer => _$signUpRequestSerializer;
}
