// ignore_for_file: constant_identifier_names

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'server_code.g.dart';

class ServerCode extends EnumClass {
  // static const ServerCode yes = _$yes;
  static const ServerCode OC_OK = _$OC_OK;
  static const ServerCode OC_UNKNOWN_ERROR = _$OC_UNKNOWN_ERROR;
  static const ServerCode OC_GENERAL_ERROR = _$OC_GENERAL_ERROR;
  static const ServerCode OC_INVALID_ENTITY_ATTRS = _$OC_INVALID_ENTITY_ATTRS;

  const ServerCode._(String name) : super(name);

  static BuiltSet<ServerCode> get values => _$values;
  static ServerCode valueOf(String name) => _$valueOf(name);
  static Serializer<ServerCode> get serializer => _$serverCodeSerializer;
}
