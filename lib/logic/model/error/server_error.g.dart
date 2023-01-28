// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServerError> _$serverErrorSerializer = new _$ServerErrorSerializer();

class _$ServerErrorSerializer implements StructuredSerializer<ServerError> {
  @override
  final Iterable<Type> types = const [ServerError, _$ServerError];
  @override
  final String wireName = 'ServerError';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServerError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'error',
      serializers.serialize(object.error,
          specifiedType: const FullType(String)),
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
      'errorMsg',
      serializers.serialize(object.errorMsg,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ServerError deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServerErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'errorMsg':
          result.errorMsg = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ServerError extends ServerError {
  @override
  final String error;
  @override
  final String field;
  @override
  final String errorMsg;

  factory _$ServerError([void Function(ServerErrorBuilder)? updates]) =>
      (new ServerErrorBuilder()..update(updates))._build();

  _$ServerError._(
      {required this.error, required this.field, required this.errorMsg})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'ServerError', 'error');
    BuiltValueNullFieldError.checkNotNull(field, r'ServerError', 'field');
    BuiltValueNullFieldError.checkNotNull(errorMsg, r'ServerError', 'errorMsg');
  }

  @override
  ServerError rebuild(void Function(ServerErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServerErrorBuilder toBuilder() => new ServerErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerError &&
        error == other.error &&
        field == other.field &&
        errorMsg == other.errorMsg;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, errorMsg.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServerError')
          ..add('error', error)
          ..add('field', field)
          ..add('errorMsg', errorMsg))
        .toString();
  }
}

class ServerErrorBuilder implements Builder<ServerError, ServerErrorBuilder> {
  _$ServerError? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _field;
  String? get field => _$this._field;
  set field(String? field) => _$this._field = field;

  String? _errorMsg;
  String? get errorMsg => _$this._errorMsg;
  set errorMsg(String? errorMsg) => _$this._errorMsg = errorMsg;

  ServerErrorBuilder();

  ServerErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _field = $v.field;
      _errorMsg = $v.errorMsg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServerError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServerError;
  }

  @override
  void update(void Function(ServerErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServerError build() => _build();

  _$ServerError _build() {
    final _$result = _$v ??
        new _$ServerError._(
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'ServerError', 'error'),
            field: BuiltValueNullFieldError.checkNotNull(
                field, r'ServerError', 'field'),
            errorMsg: BuiltValueNullFieldError.checkNotNull(
                errorMsg, r'ServerError', 'errorMsg'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
