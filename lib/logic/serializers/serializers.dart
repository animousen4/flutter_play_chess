import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/created_login/created_login.dart';
import 'package:flutter_play_chess/logic/model/entity/info/created_user/created_user.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/model/entity/info/user_info/user_info.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';
import 'package:flutter_play_chess/logic/model/request/log_in/log_in_request.dart';
import 'package:flutter_play_chess/logic/model/request/sign_up/sign_up_request.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_play_chess/logic/model/response/log_in/log_in_response.dart';
import 'package:flutter_play_chess/logic/model/response/sign_up/sign_up_response.dart';
part 'serializers.g.dart';

const requestsTypes = [
  LogInRequest,
  SignUpRequest,
];

const responseTypes = [LogInResponse, SignUpResponse];

const entityTypes = [];

@SerializersFor([
  ...requestsTypes,
  ...responseTypes,
  ...entityTypes,
])
Serializers serializersRaw = _$serializersRaw;

Serializers serializers =
    (serializersRaw.toBuilder()..addPlugin(StandardJsonPlugin())).build();
