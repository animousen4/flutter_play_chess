import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'server_code.g.dart';

class ServerCode extends EnumClass {
  // static const ServerCode yes = _$yes;
  static const ServerCode OC_OK = _$OC_OK;
  static const ServerCode OC_UNKNOWN_ERROR = _$OC_UNKNOWN_ERROR;

  const ServerCode._(String name) : super(name);

  static BuiltSet<ServerCode> get values => _$values;
  static ServerCode valueOf(String name) => _$valueOf(name);
  static Serializer<ServerCode> get serializer => _$serverCodeSerializer;
}
