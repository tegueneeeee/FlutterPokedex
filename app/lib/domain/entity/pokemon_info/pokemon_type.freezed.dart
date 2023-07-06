// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) {
  return _PokemonType.fromJson(json);
}

/// @nodoc
mixin _$PokemonType {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonTypeCopyWith<PokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeCopyWith<$Res> {
  factory $PokemonTypeCopyWith(
          PokemonType value, $Res Function(PokemonType) then) =
      _$PokemonTypeCopyWithImpl<$Res, PokemonType>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonTypeCopyWithImpl<$Res, $Val extends PokemonType>
    implements $PokemonTypeCopyWith<$Res> {
  _$PokemonTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonTypeCopyWith<$Res>
    implements $PokemonTypeCopyWith<$Res> {
  factory _$$_PokemonTypeCopyWith(
          _$_PokemonType value, $Res Function(_$_PokemonType) then) =
      __$$_PokemonTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_PokemonTypeCopyWithImpl<$Res>
    extends _$PokemonTypeCopyWithImpl<$Res, _$_PokemonType>
    implements _$$_PokemonTypeCopyWith<$Res> {
  __$$_PokemonTypeCopyWithImpl(
      _$_PokemonType _value, $Res Function(_$_PokemonType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_PokemonType(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonType implements _PokemonType {
  _$_PokemonType({required this.name, required this.url});

  factory _$_PokemonType.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonTypeFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonType(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonType &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonTypeCopyWith<_$_PokemonType> get copyWith =>
      __$$_PokemonTypeCopyWithImpl<_$_PokemonType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonTypeToJson(
      this,
    );
  }
}

abstract class _PokemonType implements PokemonType {
  factory _PokemonType(
      {required final String name, required final String url}) = _$_PokemonType;

  factory _PokemonType.fromJson(Map<String, dynamic> json) =
      _$_PokemonType.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonTypeCopyWith<_$_PokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}
