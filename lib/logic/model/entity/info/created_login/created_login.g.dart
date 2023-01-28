// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_login.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreatedLoginEntity> _$createdLoginEntitySerializer =
    new _$CreatedLoginEntitySerializer();

class _$CreatedLoginEntitySerializer
    implements StructuredSerializer<CreatedLoginEntity> {
  @override
  final Iterable<Type> types = const [CreatedLoginEntity, _$CreatedLoginEntity];
  @override
  final String wireName = 'CreatedLoginEntity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreatedLoginEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accessToken;
    if (value != null) {
      result
        ..add('accessToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jwtToken;
    if (value != null) {
      result
        ..add('jwtToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CreatedLoginEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatedLoginEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jwtToken':
          result.jwtToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatedLoginEntity extends CreatedLoginEntity {
  @override
  final String? accessToken;
  @override
  final String? jwtToken;

  factory _$CreatedLoginEntity(
          [void Function(CreatedLoginEntityBuilder)? updates]) =>
      (new CreatedLoginEntityBuilder()..update(updates))._build();

  _$CreatedLoginEntity._({this.accessToken, this.jwtToken}) : super._();

  @override
  CreatedLoginEntity rebuild(
          void Function(CreatedLoginEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatedLoginEntityBuilder toBuilder() =>
      new CreatedLoginEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatedLoginEntity &&
        accessToken == other.accessToken &&
        jwtToken == other.jwtToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, jwtToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatedLoginEntity')
          ..add('accessToken', accessToken)
          ..add('jwtToken', jwtToken))
        .toString();
  }
}

class CreatedLoginEntityBuilder
    implements Builder<CreatedLoginEntity, CreatedLoginEntityBuilder> {
  _$CreatedLoginEntity? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _jwtToken;
  String? get jwtToken => _$this._jwtToken;
  set jwtToken(String? jwtToken) => _$this._jwtToken = jwtToken;

  CreatedLoginEntityBuilder();

  CreatedLoginEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _jwtToken = $v.jwtToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatedLoginEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatedLoginEntity;
  }

  @override
  void update(void Function(CreatedLoginEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatedLoginEntity build() => _build();

  _$CreatedLoginEntity _build() {
    final _$result = _$v ??
        new _$CreatedLoginEntity._(
            accessToken: accessToken, jwtToken: jwtToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
