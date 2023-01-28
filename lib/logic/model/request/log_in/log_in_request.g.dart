// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LogInRequest> _$logInRequestSerializer =
    new _$LogInRequestSerializer();

class _$LogInRequestSerializer implements StructuredSerializer<LogInRequest> {
  @override
  final Iterable<Type> types = const [LogInRequest, _$LogInRequest];
  @override
  final String wireName = 'LogInRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, LogInRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entityInfo',
      serializers.serialize(object.entityInfo,
          specifiedType: const FullType(EntityLogin)),
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
  LogInRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LogInRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entityInfo':
          result.entityInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntityLogin))! as EntityLogin);
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

class _$LogInRequest extends LogInRequest {
  @override
  final EntityLogin entityInfo;
  @override
  final String version;
  @override
  final EntityAction entityAction;

  factory _$LogInRequest([void Function(LogInRequestBuilder)? updates]) =>
      (new LogInRequestBuilder()..update(updates))._build();

  _$LogInRequest._(
      {required this.entityInfo,
      required this.version,
      required this.entityAction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entityInfo, r'LogInRequest', 'entityInfo');
    BuiltValueNullFieldError.checkNotNull(version, r'LogInRequest', 'version');
    BuiltValueNullFieldError.checkNotNull(
        entityAction, r'LogInRequest', 'entityAction');
  }

  @override
  LogInRequest rebuild(void Function(LogInRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogInRequestBuilder toBuilder() => new LogInRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogInRequest &&
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
    return (newBuiltValueToStringHelper(r'LogInRequest')
          ..add('entityInfo', entityInfo)
          ..add('version', version)
          ..add('entityAction', entityAction))
        .toString();
  }
}

class LogInRequestBuilder
    implements Builder<LogInRequest, LogInRequestBuilder> {
  _$LogInRequest? _$v;

  EntityLoginBuilder? _entityInfo;
  EntityLoginBuilder get entityInfo =>
      _$this._entityInfo ??= new EntityLoginBuilder();
  set entityInfo(EntityLoginBuilder? entityInfo) =>
      _$this._entityInfo = entityInfo;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  EntityActionBuilder? _entityAction;
  EntityActionBuilder get entityAction =>
      _$this._entityAction ??= new EntityActionBuilder();
  set entityAction(EntityActionBuilder? entityAction) =>
      _$this._entityAction = entityAction;

  LogInRequestBuilder();

  LogInRequestBuilder get _$this {
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
  void replace(LogInRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogInRequest;
  }

  @override
  void update(void Function(LogInRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogInRequest build() => _build();

  _$LogInRequest _build() {
    _$LogInRequest _$result;
    try {
      _$result = _$v ??
          new _$LogInRequest._(
              entityInfo: entityInfo.build(),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'LogInRequest', 'version'),
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
            r'LogInRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
