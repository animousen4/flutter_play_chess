import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_play_chess/logic/model/abstract_response.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/entity/info/created_user/created_user.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'sign_up_response.g.dart';

abstract class SignUpResponse
    implements Built<SignUpResponse, SignUpResponseBuilder>, AbstractResponse {
  // Fields

  @override
  CreatedUserEntity get createdEntity;

  SignUpResponse._();

  factory SignUpResponse([void Function(SignUpResponseBuilder) updates]) =
      _$SignUpResponse;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SignUpResponse.serializer, this));
  }

  static SignUpResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        SignUpResponse.serializer, json.decode(jsonString))!;
  }

  static Serializer<SignUpResponse> get serializer =>
      _$signUpResponseSerializer;
}
