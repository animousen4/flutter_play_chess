// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_login.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntityLogin> _$entityLoginSerializer = new _$EntityLoginSerializer();

class _$EntityLoginSerializer implements StructuredSerializer<EntityLogin> {
  @override
  final Iterable<Type> types = const [EntityLogin, _$EntityLogin];
  @override
  final String wireName = 'EntityLogin';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntityLogin object,
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
    value = object.userLogin;
    if (value != null) {
      result
        ..add('userLogin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userPass;
    if (value != null) {
      result
        ..add('userPass')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appPackage;
    if (value != null) {
      result
        ..add('appPackage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appVersion;
    if (value != null) {
      result
        ..add('appVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EntityLogin deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntityLoginBuilder();

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
        case 'userLogin':
          result.userLogin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userPass':
          result.userPass = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'appPackage':
          result.appPackage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'appVersion':
          result.appVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$EntityLogin extends EntityLogin {
  @override
  final String? accessToken;
  @override
  final String? userLogin;
  @override
  final String? userPass;
  @override
  final String? appPackage;
  @override
  final String? appVersion;

  factory _$EntityLogin([void Function(EntityLoginBuilder)? updates]) =>
      (new EntityLoginBuilder()..update(updates))._build();

  _$EntityLogin._(
      {this.accessToken,
      this.userLogin,
      this.userPass,
      this.appPackage,
      this.appVersion})
      : super._();

  @override
  EntityLogin rebuild(void Function(EntityLoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntityLoginBuilder toBuilder() => new EntityLoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntityLogin &&
        accessToken == other.accessToken &&
        userLogin == other.userLogin &&
        userPass == other.userPass &&
        appPackage == other.appPackage &&
        appVersion == other.appVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, userLogin.hashCode);
    _$hash = $jc(_$hash, userPass.hashCode);
    _$hash = $jc(_$hash, appPackage.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EntityLogin')
          ..add('accessToken', accessToken)
          ..add('userLogin', userLogin)
          ..add('userPass', userPass)
          ..add('appPackage', appPackage)
          ..add('appVersion', appVersion))
        .toString();
  }
}

class EntityLoginBuilder implements Builder<EntityLogin, EntityLoginBuilder> {
  _$EntityLogin? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _userLogin;
  String? get userLogin => _$this._userLogin;
  set userLogin(String? userLogin) => _$this._userLogin = userLogin;

  String? _userPass;
  String? get userPass => _$this._userPass;
  set userPass(String? userPass) => _$this._userPass = userPass;

  String? _appPackage;
  String? get appPackage => _$this._appPackage;
  set appPackage(String? appPackage) => _$this._appPackage = appPackage;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  EntityLoginBuilder();

  EntityLoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _userLogin = $v.userLogin;
      _userPass = $v.userPass;
      _appPackage = $v.appPackage;
      _appVersion = $v.appVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntityLogin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntityLogin;
  }

  @override
  void update(void Function(EntityLoginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntityLogin build() => _build();

  _$EntityLogin _build() {
    final _$result = _$v ??
        new _$EntityLogin._(
            accessToken: accessToken,
            userLogin: userLogin,
            userPass: userPass,
            appPackage: appPackage,
            appVersion: appVersion);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
