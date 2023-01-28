// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreatedUserEntity> _$createdUserEntitySerializer =
    new _$CreatedUserEntitySerializer();

class _$CreatedUserEntitySerializer
    implements StructuredSerializer<CreatedUserEntity> {
  @override
  final Iterable<Type> types = const [CreatedUserEntity, _$CreatedUserEntity];
  @override
  final String wireName = 'CreatedUserEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, CreatedUserEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAccessToken;
    if (value != null) {
      result
        ..add('createdAccessToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdPlayerId;
    if (value != null) {
      result
        ..add('createdPlayerId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CreatedUserEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatedUserEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdAccessToken':
          result.createdAccessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdPlayerId':
          result.createdPlayerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatedUserEntity extends CreatedUserEntity {
  @override
  final String? createdAccessToken;
  @override
  final int? createdPlayerId;

  factory _$CreatedUserEntity(
          [void Function(CreatedUserEntityBuilder)? updates]) =>
      (new CreatedUserEntityBuilder()..update(updates))._build();

  _$CreatedUserEntity._({this.createdAccessToken, this.createdPlayerId})
      : super._();

  @override
  CreatedUserEntity rebuild(void Function(CreatedUserEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatedUserEntityBuilder toBuilder() =>
      new CreatedUserEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatedUserEntity &&
        createdAccessToken == other.createdAccessToken &&
        createdPlayerId == other.createdPlayerId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAccessToken.hashCode);
    _$hash = $jc(_$hash, createdPlayerId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatedUserEntity')
          ..add('createdAccessToken', createdAccessToken)
          ..add('createdPlayerId', createdPlayerId))
        .toString();
  }
}

class CreatedUserEntityBuilder
    implements Builder<CreatedUserEntity, CreatedUserEntityBuilder> {
  _$CreatedUserEntity? _$v;

  String? _createdAccessToken;
  String? get createdAccessToken => _$this._createdAccessToken;
  set createdAccessToken(String? createdAccessToken) =>
      _$this._createdAccessToken = createdAccessToken;

  int? _createdPlayerId;
  int? get createdPlayerId => _$this._createdPlayerId;
  set createdPlayerId(int? createdPlayerId) =>
      _$this._createdPlayerId = createdPlayerId;

  CreatedUserEntityBuilder();

  CreatedUserEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAccessToken = $v.createdAccessToken;
      _createdPlayerId = $v.createdPlayerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatedUserEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatedUserEntity;
  }

  @override
  void update(void Function(CreatedUserEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatedUserEntity build() => _build();

  _$CreatedUserEntity _build() {
    final _$result = _$v ??
        new _$CreatedUserEntity._(
            createdAccessToken: createdAccessToken,
            createdPlayerId: createdPlayerId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
