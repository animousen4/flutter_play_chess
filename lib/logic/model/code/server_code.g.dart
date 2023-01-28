// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_code.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ServerCode _$OC_OK = const ServerCode._('OC_OK');
const ServerCode _$OC_UNKNOWN_ERROR = const ServerCode._('OC_UNKNOWN_ERROR');
const ServerCode _$OC_GENERAL_ERROR = const ServerCode._('OC_GENERAL_ERROR');
const ServerCode _$OC_INVALID_ENTITY_ATTRS =
    const ServerCode._('OC_INVALID_ENTITY_ATTRS');

ServerCode _$valueOf(String name) {
  switch (name) {
    case 'OC_OK':
      return _$OC_OK;
    case 'OC_UNKNOWN_ERROR':
      return _$OC_UNKNOWN_ERROR;
    case 'OC_GENERAL_ERROR':
      return _$OC_GENERAL_ERROR;
    case 'OC_INVALID_ENTITY_ATTRS':
      return _$OC_INVALID_ENTITY_ATTRS;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ServerCode> _$values =
    new BuiltSet<ServerCode>(const <ServerCode>[
  _$OC_OK,
  _$OC_UNKNOWN_ERROR,
  _$OC_GENERAL_ERROR,
  _$OC_INVALID_ENTITY_ATTRS,
]);

Serializer<ServerCode> _$serverCodeSerializer = new _$ServerCodeSerializer();

class _$ServerCodeSerializer implements PrimitiveSerializer<ServerCode> {
  @override
  final Iterable<Type> types = const <Type>[ServerCode];
  @override
  final String wireName = 'ServerCode';

  @override
  Object serialize(Serializers serializers, ServerCode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ServerCode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ServerCode.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
