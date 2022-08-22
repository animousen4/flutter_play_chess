import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/created_login/created_login.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/model/error/server_error.dart';
import 'package:flutter_play_chess/logic/model/request/log_in_request.dart';
import 'package:flutter_play_chess/logic/model/response/log_in_response.dart';
import 'package:built_collection/built_collection.dart';
part 'serializers.g.dart';

@SerializersFor([
  LogInRequest,
  EntityLogin,
  CreatedLoginEntity,
  LogInResponse

])
Serializers serializersRaw = _$serializersRaw;

Serializers serializers = (serializersRaw.toBuilder()..addPlugin(StandardJsonPlugin())).build();
