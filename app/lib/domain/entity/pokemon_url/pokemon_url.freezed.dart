// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonUrl _$PokemonUrlFromJson(Map<String, dynamic> json) {
  return _PokemonUrl.fromJson(json);
}

/// @nodoc
mixin _$PokemonUrl {
  List<Result> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonUrlCopyWith<PokemonUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonUrlCopyWith<$Res> {
  factory $PokemonUrlCopyWith(
          PokemonUrl value, $Res Function(PokemonUrl) then) =
      _$PokemonUrlCopyWithImpl<$Res, PokemonUrl>;
  @useResult
  $Res call({List<Result> results});
}

/// @nodoc
class _$PokemonUrlCopyWithImpl<$Res, $Val extends PokemonUrl>
    implements $PokemonUrlCopyWith<$Res> {
  _$PokemonUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonUrlCopyWith<$Res>
    implements $PokemonUrlCopyWith<$Res> {
  factory _$$_PokemonUrlCopyWith(
          _$_PokemonUrl value, $Res Function(_$_PokemonUrl) then) =
      __$$_PokemonUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Result> results});
}

/// @nodoc
class __$$_PokemonUrlCopyWithImpl<$Res>
    extends _$PokemonUrlCopyWithImpl<$Res, _$_PokemonUrl>
    implements _$$_PokemonUrlCopyWith<$Res> {
  __$$_PokemonUrlCopyWithImpl(
      _$_PokemonUrl _value, $Res Function(_$_PokemonUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$_PokemonUrl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonUrl implements _PokemonUrl {
  _$_PokemonUrl({required final List<Result> results}) : _results = results;

  factory _$_PokemonUrl.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonUrlFromJson(json);

  final List<Result> _results;
  @override
  List<Result> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonUrl(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonUrl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonUrlCopyWith<_$_PokemonUrl> get copyWith =>
      __$$_PokemonUrlCopyWithImpl<_$_PokemonUrl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonUrlToJson(
      this,
    );
  }
}

abstract class _PokemonUrl implements PokemonUrl {
  factory _PokemonUrl({required final List<Result> results}) = _$_PokemonUrl;

  factory _PokemonUrl.fromJson(Map<String, dynamic> json) =
      _$_PokemonUrl.fromJson;

  @override
  List<Result> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonUrlCopyWith<_$_PokemonUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
