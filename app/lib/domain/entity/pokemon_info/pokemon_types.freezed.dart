// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonTypes _$PokemonTypesFromJson(Map<String, dynamic> json) {
  return _PokemonTypes.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypes {
  int get slot => throw _privateConstructorUsedError;
  PokemonType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonTypesCopyWith<PokemonTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypesCopyWith<$Res> {
  factory $PokemonTypesCopyWith(
          PokemonTypes value, $Res Function(PokemonTypes) then) =
      _$PokemonTypesCopyWithImpl<$Res, PokemonTypes>;
  @useResult
  $Res call({int slot, PokemonType type});

  $PokemonTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$PokemonTypesCopyWithImpl<$Res, $Val extends PokemonTypes>
    implements $PokemonTypesCopyWith<$Res> {
  _$PokemonTypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemonTypeCopyWith<$Res> get type {
    return $PokemonTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PokemonTypesCopyWith<$Res>
    implements $PokemonTypesCopyWith<$Res> {
  factory _$$_PokemonTypesCopyWith(
          _$_PokemonTypes value, $Res Function(_$_PokemonTypes) then) =
      __$$_PokemonTypesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, PokemonType type});

  @override
  $PokemonTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$_PokemonTypesCopyWithImpl<$Res>
    extends _$PokemonTypesCopyWithImpl<$Res, _$_PokemonTypes>
    implements _$$_PokemonTypesCopyWith<$Res> {
  __$$_PokemonTypesCopyWithImpl(
      _$_PokemonTypes _value, $Res Function(_$_PokemonTypes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$_PokemonTypes(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonTypes implements _PokemonTypes {
  _$_PokemonTypes({required this.slot, required this.type});

  factory _$_PokemonTypes.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonTypesFromJson(json);

  @override
  final int slot;
  @override
  final PokemonType type;

  @override
  String toString() {
    return 'PokemonTypes(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonTypes &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonTypesCopyWith<_$_PokemonTypes> get copyWith =>
      __$$_PokemonTypesCopyWithImpl<_$_PokemonTypes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonTypesToJson(
      this,
    );
  }
}

abstract class _PokemonTypes implements PokemonTypes {
  factory _PokemonTypes(
      {required final int slot,
      required final PokemonType type}) = _$_PokemonTypes;

  factory _PokemonTypes.fromJson(Map<String, dynamic> json) =
      _$_PokemonTypes.fromJson;

  @override
  int get slot;
  @override
  PokemonType get type;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonTypesCopyWith<_$_PokemonTypes> get copyWith =>
      throw _privateConstructorUsedError;
}
