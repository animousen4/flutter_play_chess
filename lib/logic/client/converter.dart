import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/serializers/serializers.dart';
import 'package:logger/logger.dart';

class DataConverter extends JsonConverter {
  final logger = Logger();

  @override
  Request convertRequest(Request request) {
    final json = serializers.serialize(request.body,
        specifiedType: FullType.nullable(request.body.runtimeType));
    //print(request.body.toJson());
    return super.convertRequest(request.copyWith(body: json));
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    //logger.d(BodyType);
    final object = (serializers.deserialize(json.decode(response.body),
        specifiedType: FullType.nullable(BodyType))) as BodyType;

    return response.copyWith(body: object);
  }
}
