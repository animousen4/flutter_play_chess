// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ActionCode _$CREATE_ENTITY = const ActionCode._('CREATE_ENTITY');

ActionCode _$valueOf(String name) {
  switch (name) {
    case 'CREATE_ENTITY':
      return _$CREATE_ENTITY;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ActionCode> _$values =
    new BuiltSet<ActionCode>(const <ActionCode>[
  _$CREATE_ENTITY,
]);

Serializer<EntityAction> _$entityActionSerializer =
    new _$EntityActionSerializer();
Serializer<ActionCode> _$actionCodeSerializer = new _$ActionCodeSerializer();

class _$EntityActionSerializer implements StructuredSerializer<EntityAction> {
  @override
  final Iterable<Type> types = const [EntityAction, _$EntityAction];
  @override
  final String wireName = 'EntityAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntityAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'actionCode',
      serializers.serialize(object.actionCode,
          specifiedType: const FullType(ActionCode)),
    ];

    return result;
  }

  @override
  EntityAction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntityActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'actionCode':
          result.actionCode = serializers.deserialize(value,
              specifiedType: const FullType(ActionCode))! as ActionCode;
          break;
      }
    }

    return result.build();
  }
}

class _$ActionCodeSerializer implements PrimitiveSerializer<ActionCode> {
  @override
  final Iterable<Type> types = const <Type>[ActionCode];
  @override
  final String wireName = 'ActionCode';

  @override
  Object serialize(Serializers serializers, ActionCode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ActionCode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ActionCode.valueOf(serialized as String);
}

class _$EntityAction extends EntityAction {
  @override
  final ActionCode actionCode;

  factory _$EntityAction([void Function(EntityActionBuilder)? updates]) =>
      (new EntityActionBuilder()..update(updates))._build();

  _$EntityAction._({required this.actionCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        actionCode, r'EntityAction', 'actionCode');
  }

  @override
  EntityAction rebuild(void Function(EntityActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntityActionBuilder toBuilder() => new EntityActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntityAction && actionCode == other.actionCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actionCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EntityAction')
          ..add('actionCode', actionCode))
        .toString();
  }
}

class EntityActionBuilder
    implements Builder<EntityAction, EntityActionBuilder> {
  _$EntityAction? _$v;

  ActionCode? _actionCode;
  ActionCode? get actionCode => _$this._actionCode;
  set actionCode(ActionCode? actionCode) => _$this._actionCode = actionCode;

  EntityActionBuilder();

  EntityActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actionCode = $v.actionCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntityAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntityAction;
  }

  @override
  void update(void Function(EntityActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntityAction build() => _build();

  _$EntityAction _build() {
    final _$result = _$v ??
        new _$EntityAction._(
            actionCode: BuiltValueNullFieldError.checkNotNull(
                actionCode, r'EntityAction', 'actionCode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
