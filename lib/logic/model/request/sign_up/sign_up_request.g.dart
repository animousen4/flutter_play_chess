// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignUpRequest> _$signUpRequestSerializer =
    new _$SignUpRequestSerializer();

class _$SignUpRequestSerializer implements StructuredSerializer<SignUpRequest> {
  @override
  final Iterable<Type> types = const [SignUpRequest, _$SignUpRequest];
  @override
  final String wireName = 'SignUpRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, SignUpRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entityInfo',
      serializers.serialize(object.entityInfo,
          specifiedType: const FullType(EntityUserInfo)),
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
      'entityAction',
      serializers.serialize(object.entityAction,
          specifiedType: const FullType(EntityAction)),
    ];

    return result;
  }

  @override
  SignUpRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignUpRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entityInfo':
          result.entityInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EntityUserInfo))!
              as EntityUserInfo);
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'entityAction':
          result.entityAction.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntityAction))! as EntityAction);
          break;
      }
    }

    return result.build();
  }
}

class _$SignUpRequest extends SignUpRequest {
  @override
  final EntityUserInfo entityInfo;
  @override
  final String version;
  @override
  final EntityAction entityAction;

  factory _$SignUpRequest([void Function(SignUpRequestBuilder)? updates]) =>
      (new SignUpRequestBuilder()..update(updates))._build();

  _$SignUpRequest._(
      {required this.entityInfo,
      required this.version,
      required this.entityAction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entityInfo, r'SignUpRequest', 'entityInfo');
    BuiltValueNullFieldError.checkNotNull(version, r'SignUpRequest', 'version');
    BuiltValueNullFieldError.checkNotNull(
        entityAction, r'SignUpRequest', 'entityAction');
  }

  @override
  SignUpRequest rebuild(void Function(SignUpRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpRequestBuilder toBuilder() => new SignUpRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpRequest &&
        entityInfo == other.entityInfo &&
        version == other.version &&
        entityAction == other.entityAction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, entityInfo.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, entityAction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignUpRequest')
          ..add('entityInfo', entityInfo)
          ..add('version', version)
          ..add('entityAction', entityAction))
        .toString();
  }
}

class SignUpRequestBuilder
    implements Builder<SignUpRequest, SignUpRequestBuilder> {
  _$SignUpRequest? _$v;

  EntityUserInfoBuilder? _entityInfo;
  EntityUserInfoBuilder get entityInfo =>
      _$this._entityInfo ??= new EntityUserInfoBuilder();
  set entityInfo(EntityUserInfoBuilder? entityInfo) =>
      _$this._entityInfo = entityInfo;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  EntityActionBuilder? _entityAction;
  EntityActionBuilder get entityAction =>
      _$this._entityAction ??= new EntityActionBuilder();
  set entityAction(EntityActionBuilder? entityAction) =>
      _$this._entityAction = entityAction;

  SignUpRequestBuilder();

  SignUpRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entityInfo = $v.entityInfo.toBuilder();
      _version = $v.version;
      _entityAction = $v.entityAction.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUpRequest;
  }

  @override
  void update(void Function(SignUpRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignUpRequest build() => _build();

  _$SignUpRequest _build() {
    _$SignUpRequest _$result;
    try {
      _$result = _$v ??
          new _$SignUpRequest._(
              entityInfo: entityInfo.build(),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'SignUpRequest', 'version'),
              entityAction: entityAction.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entityInfo';
        entityInfo.build();

        _$failedField = 'entityAction';
        entityAction.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SignUpRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
