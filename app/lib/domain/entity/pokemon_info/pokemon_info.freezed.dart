// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonInfo _$PokemonInfoFromJson(Map<String, dynamic> json) {
  return _PokemonInfo.fromJson(json);
}

/// @nodoc
mixin _$PokemonInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonInfoCopyWith<PokemonInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonInfoCopyWith<$Res> {
  factory $PokemonInfoCopyWith(
          PokemonInfo value, $Res Function(PokemonInfo) then) =
      _$PokemonInfoCopyWithImpl<$Res, PokemonInfo>;
  @useResult
  $Res call({int id, String name, int height, int weight});
}

/// @nodoc
class _$PokemonInfoCopyWithImpl<$Res, $Val extends PokemonInfo>
    implements $PokemonInfoCopyWith<$Res> {
  _$PokemonInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonInfoCopyWith<$Res>
    implements $PokemonInfoCopyWith<$Res> {
  factory _$$_PokemonInfoCopyWith(
          _$_PokemonInfo value, $Res Function(_$_PokemonInfo) then) =
      __$$_PokemonInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int height, int weight});
}

/// @nodoc
class __$$_PokemonInfoCopyWithImpl<$Res>
    extends _$PokemonInfoCopyWithImpl<$Res, _$_PokemonInfo>
    implements _$$_PokemonInfoCopyWith<$Res> {
  __$$_PokemonInfoCopyWithImpl(
      _$_PokemonInfo _value, $Res Function(_$_PokemonInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_$_PokemonInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonInfo implements _PokemonInfo {
  _$_PokemonInfo(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight});

  factory _$_PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonInfoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;

  @override
  String toString() {
    return 'PokemonInfo(id: $id, name: $name, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonInfoCopyWith<_$_PokemonInfo> get copyWith =>
      __$$_PokemonInfoCopyWithImpl<_$_PokemonInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonInfoToJson(
      this,
    );
  }
}

abstract class _PokemonInfo implements PokemonInfo {
  factory _PokemonInfo(
      {required final int id,
      required final String name,
      required final int height,
      required final int weight}) = _$_PokemonInfo;

  factory _PokemonInfo.fromJson(Map<String, dynamic> json) =
      _$_PokemonInfo.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonInfoCopyWith<_$_PokemonInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
