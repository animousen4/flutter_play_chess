// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LogInResponse> _$logInResponseSerializer =
    new _$LogInResponseSerializer();

class _$LogInResponseSerializer implements StructuredSerializer<LogInResponse> {
  @override
  final Iterable<Type> types = const [LogInResponse, _$LogInResponse];
  @override
  final String wireName = 'LogInResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, LogInResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'createdEntity',
      serializers.serialize(object.createdEntity,
          specifiedType: const FullType(CreatedLoginEntity)),
      'code',
      serializers.serialize(object.code,
          specifiedType: const FullType(ServerCode)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'error',
      serializers.serialize(object.error,
          specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ServerError)])),
      'execTimeMillis',
      serializers.serialize(object.execTimeMillis,
          specifiedType: const FullType(int)),
      'completed',
      serializers.serialize(object.completed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  LogInResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LogInResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdEntity':
          result.createdEntity.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CreatedLoginEntity))!
              as CreatedLoginEntity);
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(ServerCode))! as ServerCode;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'errors':
          result.errors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ServerError)]))!
              as BuiltList<Object?>);
          break;
        case 'execTimeMillis':
          result.execTimeMillis = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$LogInResponse extends LogInResponse {
  @override
  final CreatedLoginEntity createdEntity;
  @override
  final ServerCode code;
  @override
  final String message;
  @override
  final String error;
  @override
  final String version;
  @override
  final BuiltList<ServerError> errors;
  @override
  final int execTimeMillis;
  @override
  final bool completed;

  factory _$LogInResponse([void Function(LogInResponseBuilder)? updates]) =>
      (new LogInResponseBuilder()..update(updates))._build();

  _$LogInResponse._(
      {required this.createdEntity,
      required this.code,
      required this.message,
      required this.error,
      required this.version,
      required this.errors,
      required this.execTimeMillis,
      required this.completed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        createdEntity, r'LogInResponse', 'createdEntity');
    BuiltValueNullFieldError.checkNotNull(code, r'LogInResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(message, r'LogInResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'LogInResponse', 'error');
    BuiltValueNullFieldError.checkNotNull(version, r'LogInResponse', 'version');
    BuiltValueNullFieldError.checkNotNull(errors, r'LogInResponse', 'errors');
    BuiltValueNullFieldError.checkNotNull(
        execTimeMillis, r'LogInResponse', 'execTimeMillis');
    BuiltValueNullFieldError.checkNotNull(
        completed, r'LogInResponse', 'completed');
  }

  @override
  LogInResponse rebuild(void Function(LogInResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogInResponseBuilder toBuilder() => new LogInResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogInResponse &&
        createdEntity == other.createdEntity &&
        code == other.code &&
        message == other.message &&
        error == other.error &&
        version == other.version &&
        errors == other.errors &&
        execTimeMillis == other.execTimeMillis &&
        completed == other.completed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdEntity.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jc(_$hash, execTimeMillis.hashCode);
    _$hash = $jc(_$hash, completed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogInResponse')
          ..add('createdEntity', createdEntity)
          ..add('code', code)
          ..add('message', message)
          ..add('error', error)
          ..add('version', version)
          ..add('errors', errors)
          ..add('execTimeMillis', execTimeMillis)
          ..add('completed', completed))
        .toString();
  }
}

class LogInResponseBuilder
    implements Builder<LogInResponse, LogInResponseBuilder> {
  _$LogInResponse? _$v;

  CreatedLoginEntityBuilder? _createdEntity;
  CreatedLoginEntityBuilder get createdEntity =>
      _$this._createdEntity ??= new CreatedLoginEntityBuilder();
  set createdEntity(CreatedLoginEntityBuilder? createdEntity) =>
      _$this._createdEntity = createdEntity;

  ServerCode? _code;
  ServerCode? get code => _$this._code;
  set code(ServerCode? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  ListBuilder<ServerError>? _errors;
  ListBuilder<ServerError> get errors =>
      _$this._errors ??= new ListBuilder<ServerError>();
  set errors(ListBuilder<ServerError>? errors) => _$this._errors = errors;

  int? _execTimeMillis;
  int? get execTimeMillis => _$this._execTimeMillis;
  set execTimeMillis(int? execTimeMillis) =>
      _$this._execTimeMillis = execTimeMillis;

  bool? _completed;
  bool? get completed => _$this._completed;
  set completed(bool? completed) => _$this._completed = completed;

  LogInResponseBuilder();

  LogInResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdEntity = $v.createdEntity.toBuilder();
      _code = $v.code;
      _message = $v.message;
      _error = $v.error;
      _version = $v.version;
      _errors = $v.errors.toBuilder();
      _execTimeMillis = $v.execTimeMillis;
      _completed = $v.completed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogInResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogInResponse;
  }

  @override
  void update(void Function(LogInResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogInResponse build() => _build();

  _$LogInResponse _build() {
    _$LogInResponse _$result;
    try {
      _$result = _$v ??
          new _$LogInResponse._(
              createdEntity: createdEntity.build(),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'LogInResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'LogInResponse', 'message'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'LogInResponse', 'error'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'LogInResponse', 'version'),
              errors: errors.build(),
              execTimeMillis: BuiltValueNullFieldError.checkNotNull(
                  execTimeMillis, r'LogInResponse', 'execTimeMillis'),
              completed: BuiltValueNullFieldError.checkNotNull(
                  completed, r'LogInResponse', 'completed'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createdEntity';
        createdEntity.build();

        _$failedField = 'errors';
        errors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LogInResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
