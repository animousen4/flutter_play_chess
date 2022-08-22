// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_code.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ServerCode _$OC_OK = const ServerCode._('OC_OK');
const ServerCode _$OC_UNKNOWN_ERROR = const ServerCode._('OC_UNKNOWN_ERROR');

ServerCode _$valueOf(String name) {
  switch (name) {
    case 'OC_OK':
      return _$OC_OK;
    case 'OC_UNKNOWN_ERROR':
      return _$OC_UNKNOWN_ERROR;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ServerCode> _$values =
    new BuiltSet<ServerCode>(const <ServerCode>[
  _$OC_OK,
  _$OC_UNKNOWN_ERROR,
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
