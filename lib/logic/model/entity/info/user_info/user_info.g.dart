// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntityUserInfo> _$entityUserInfoSerializer =
    new _$EntityUserInfoSerializer();

class _$EntityUserInfoSerializer
    implements StructuredSerializer<EntityUserInfo> {
  @override
  final Iterable<Type> types = const [EntityUserInfo, _$EntityUserInfo];
  @override
  final String wireName = 'EntityUserInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntityUserInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.playerKindId;
    if (value != null) {
      result
        ..add('playerKindId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.playerStatusId;
    if (value != null) {
      result
        ..add('playerStatusId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
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
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mail;
    if (value != null) {
      result
        ..add('mail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.activationDate;
    if (value != null) {
      result
        ..add('activationDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.middleName;
    if (value != null) {
      result
        ..add('middleName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birthDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genderId;
    if (value != null) {
      result
        ..add('genderId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countryIso;
    if (value != null) {
      result
        ..add('countryIso')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.languageId;
    if (value != null) {
      result
        ..add('languageId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isVerified;
    if (value != null) {
      result
        ..add('isVerified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.verifyDate;
    if (value != null) {
      result
        ..add('verifyDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.currentElo;
    if (value != null) {
      result
        ..add('currentElo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.newUser;
    if (value != null) {
      result
        ..add('newUser')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  EntityUserInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntityUserInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'playerKindId':
          result.playerKindId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'playerStatusId':
          result.playerStatusId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userLogin':
          result.userLogin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mail':
          result.mail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'activationDate':
          result.activationDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'middleName':
          result.middleName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genderId':
          result.genderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'countryIso':
          result.countryIso = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'languageId':
          result.languageId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'avatar':
          result.avatar.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isVerified':
          result.isVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'verifyDate':
          result.verifyDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'currentElo':
          result.currentElo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'newUser':
          result.newUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$EntityUserInfo extends EntityUserInfo {
  @override
  final int? playerKindId;
  @override
  final int? playerStatusId;
  @override
  final String? password;
  @override
  final String? userLogin;
  @override
  final String? phone;
  @override
  final String? mail;
  @override
  final String? activationDate;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? birthDate;
  @override
  final String? genderId;
  @override
  final String? countryIso;
  @override
  final int? languageId;
  @override
  final BuiltList<String>? avatar;
  @override
  final String? email;
  @override
  final bool? isVerified;
  @override
  final int? verifyDate;
  @override
  final int? currentElo;
  @override
  final bool? newUser;

  factory _$EntityUserInfo([void Function(EntityUserInfoBuilder)? updates]) =>
      (new EntityUserInfoBuilder()..update(updates))._build();

  _$EntityUserInfo._(
      {this.playerKindId,
      this.playerStatusId,
      this.password,
      this.userLogin,
      this.phone,
      this.mail,
      this.activationDate,
      this.firstName,
      this.middleName,
      this.birthDate,
      this.genderId,
      this.countryIso,
      this.languageId,
      this.avatar,
      this.email,
      this.isVerified,
      this.verifyDate,
      this.currentElo,
      this.newUser})
      : super._();

  @override
  EntityUserInfo rebuild(void Function(EntityUserInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntityUserInfoBuilder toBuilder() =>
      new EntityUserInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntityUserInfo &&
        playerKindId == other.playerKindId &&
        playerStatusId == other.playerStatusId &&
        password == other.password &&
        userLogin == other.userLogin &&
        phone == other.phone &&
        mail == other.mail &&
        activationDate == other.activationDate &&
        firstName == other.firstName &&
        middleName == other.middleName &&
        birthDate == other.birthDate &&
        genderId == other.genderId &&
        countryIso == other.countryIso &&
        languageId == other.languageId &&
        avatar == other.avatar &&
        email == other.email &&
        isVerified == other.isVerified &&
        verifyDate == other.verifyDate &&
        currentElo == other.currentElo &&
        newUser == other.newUser;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                playerKindId
                                                                                    .hashCode),
                                                                            playerStatusId
                                                                                .hashCode),
                                                                        password
                                                                            .hashCode),
                                                                    userLogin
                                                                        .hashCode),
                                                                phone.hashCode),
                                                            mail.hashCode),
                                                        activationDate
                                                            .hashCode),
                                                    firstName.hashCode),
                                                middleName.hashCode),
                                            birthDate.hashCode),
                                        genderId.hashCode),
                                    countryIso.hashCode),
                                languageId.hashCode),
                            avatar.hashCode),
                        email.hashCode),
                    isVerified.hashCode),
                verifyDate.hashCode),
            currentElo.hashCode),
        newUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EntityUserInfo')
          ..add('playerKindId', playerKindId)
          ..add('playerStatusId', playerStatusId)
          ..add('password', password)
          ..add('userLogin', userLogin)
          ..add('phone', phone)
          ..add('mail', mail)
          ..add('activationDate', activationDate)
          ..add('firstName', firstName)
          ..add('middleName', middleName)
          ..add('birthDate', birthDate)
          ..add('genderId', genderId)
          ..add('countryIso', countryIso)
          ..add('languageId', languageId)
          ..add('avatar', avatar)
          ..add('email', email)
          ..add('isVerified', isVerified)
          ..add('verifyDate', verifyDate)
          ..add('currentElo', currentElo)
          ..add('newUser', newUser))
        .toString();
  }
}

class EntityUserInfoBuilder
    implements Builder<EntityUserInfo, EntityUserInfoBuilder> {
  _$EntityUserInfo? _$v;

  int? _playerKindId;
  int? get playerKindId => _$this._playerKindId;
  set playerKindId(int? playerKindId) => _$this._playerKindId = playerKindId;

  int? _playerStatusId;
  int? get playerStatusId => _$this._playerStatusId;
  set playerStatusId(int? playerStatusId) =>
      _$this._playerStatusId = playerStatusId;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _userLogin;
  String? get userLogin => _$this._userLogin;
  set userLogin(String? userLogin) => _$this._userLogin = userLogin;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _mail;
  String? get mail => _$this._mail;
  set mail(String? mail) => _$this._mail = mail;

  String? _activationDate;
  String? get activationDate => _$this._activationDate;
  set activationDate(String? activationDate) =>
      _$this._activationDate = activationDate;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _middleName;
  String? get middleName => _$this._middleName;
  set middleName(String? middleName) => _$this._middleName = middleName;

  String? _birthDate;
  String? get birthDate => _$this._birthDate;
  set birthDate(String? birthDate) => _$this._birthDate = birthDate;

  String? _genderId;
  String? get genderId => _$this._genderId;
  set genderId(String? genderId) => _$this._genderId = genderId;

  String? _countryIso;
  String? get countryIso => _$this._countryIso;
  set countryIso(String? countryIso) => _$this._countryIso = countryIso;

  int? _languageId;
  int? get languageId => _$this._languageId;
  set languageId(int? languageId) => _$this._languageId = languageId;

  ListBuilder<String>? _avatar;
  ListBuilder<String> get avatar =>
      _$this._avatar ??= new ListBuilder<String>();
  set avatar(ListBuilder<String>? avatar) => _$this._avatar = avatar;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _isVerified;
  bool? get isVerified => _$this._isVerified;
  set isVerified(bool? isVerified) => _$this._isVerified = isVerified;

  int? _verifyDate;
  int? get verifyDate => _$this._verifyDate;
  set verifyDate(int? verifyDate) => _$this._verifyDate = verifyDate;

  int? _currentElo;
  int? get currentElo => _$this._currentElo;
  set currentElo(int? currentElo) => _$this._currentElo = currentElo;

  bool? _newUser;
  bool? get newUser => _$this._newUser;
  set newUser(bool? newUser) => _$this._newUser = newUser;

  EntityUserInfoBuilder();

  EntityUserInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _playerKindId = $v.playerKindId;
      _playerStatusId = $v.playerStatusId;
      _password = $v.password;
      _userLogin = $v.userLogin;
      _phone = $v.phone;
      _mail = $v.mail;
      _activationDate = $v.activationDate;
      _firstName = $v.firstName;
      _middleName = $v.middleName;
      _birthDate = $v.birthDate;
      _genderId = $v.genderId;
      _countryIso = $v.countryIso;
      _languageId = $v.languageId;
      _avatar = $v.avatar?.toBuilder();
      _email = $v.email;
      _isVerified = $v.isVerified;
      _verifyDate = $v.verifyDate;
      _currentElo = $v.currentElo;
      _newUser = $v.newUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntityUserInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntityUserInfo;
  }

  @override
  void update(void Function(EntityUserInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntityUserInfo build() => _build();

  _$EntityUserInfo _build() {
    _$EntityUserInfo _$result;
    try {
      _$result = _$v ??
          new _$EntityUserInfo._(
              playerKindId: playerKindId,
              playerStatusId: playerStatusId,
              password: password,
              userLogin: userLogin,
              phone: phone,
              mail: mail,
              activationDate: activationDate,
              firstName: firstName,
              middleName: middleName,
              birthDate: birthDate,
              genderId: genderId,
              countryIso: countryIso,
              languageId: languageId,
              avatar: _avatar?.build(),
              email: email,
              isVerified: isVerified,
              verifyDate: verifyDate,
              currentElo: currentElo,
              newUser: newUser);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'avatar';
        _avatar?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EntityUserInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
