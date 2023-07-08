// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonResult _$PokemonResultFromJson(Map<String, dynamic> json) {
  return _PokemonResult.fromJson(json);
}

/// @nodoc
mixin _$PokemonResult {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonResultCopyWith<PokemonResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonResultCopyWith<$Res> {
  factory $PokemonResultCopyWith(
          PokemonResult value, $Res Function(PokemonResult) then) =
      _$PokemonResultCopyWithImpl<$Res, PokemonResult>;
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) String url});
}

/// @nodoc
class _$PokemonResultCopyWithImpl<$Res, $Val extends PokemonResult>
    implements $PokemonResultCopyWith<$Res> {
  _$PokemonResultCopyWithImpl(this._value, this._then);

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
abstract class _$$_PokemonResultCopyWith<$Res>
    implements $PokemonResultCopyWith<$Res> {
  factory _$$_PokemonResultCopyWith(
          _$_PokemonResult value, $Res Function(_$_PokemonResult) then) =
      __$$_PokemonResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) String url});
}

/// @nodoc
class __$$_PokemonResultCopyWithImpl<$Res>
    extends _$PokemonResultCopyWithImpl<$Res, _$_PokemonResult>
    implements _$$_PokemonResultCopyWith<$Res> {
  __$$_PokemonResultCopyWithImpl(
      _$_PokemonResult _value, $Res Function(_$_PokemonResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_PokemonResult(
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
@HiveType(typeId: 0)
class _$_PokemonResult extends _PokemonResult {
  _$_PokemonResult(
      {@HiveField(0) required this.name, @HiveField(1) required this.url})
      : super._();

  factory _$_PokemonResult.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonResultFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String url;

  @override
  String toString() {
    return 'PokemonResult(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonResult &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonResultCopyWith<_$_PokemonResult> get copyWith =>
      __$$_PokemonResultCopyWithImpl<_$_PokemonResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonResultToJson(
      this,
    );
  }
}

abstract class _PokemonResult extends PokemonResult {
  factory _PokemonResult(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String url}) = _$_PokemonResult;
  _PokemonResult._() : super._();

  factory _PokemonResult.fromJson(Map<String, dynamic> json) =
      _$_PokemonResult.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonResultCopyWith<_$_PokemonResult> get copyWith =>
      throw _privateConstructorUsedError;
}
