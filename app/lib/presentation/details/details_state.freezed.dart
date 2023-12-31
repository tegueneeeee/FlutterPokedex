// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsState {
  Result<PokemonInfo> get pokemonInfo => throw _privateConstructorUsedError;
  Result<PokemonSpecies> get pokemonSpecies =>
      throw _privateConstructorUsedError;
  Result<Color> get averageColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsStateCopyWith<DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) then) =
      _$DetailsStateCopyWithImpl<$Res, DetailsState>;
  @useResult
  $Res call(
      {Result<PokemonInfo> pokemonInfo,
      Result<PokemonSpecies> pokemonSpecies,
      Result<Color> averageColor});
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res, $Val extends DetailsState>
    implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonInfo = null,
    Object? pokemonSpecies = null,
    Object? averageColor = null,
  }) {
    return _then(_value.copyWith(
      pokemonInfo: null == pokemonInfo
          ? _value.pokemonInfo
          : pokemonInfo // ignore: cast_nullable_to_non_nullable
              as Result<PokemonInfo>,
      pokemonSpecies: null == pokemonSpecies
          ? _value.pokemonSpecies
          : pokemonSpecies // ignore: cast_nullable_to_non_nullable
              as Result<PokemonSpecies>,
      averageColor: null == averageColor
          ? _value.averageColor
          : averageColor // ignore: cast_nullable_to_non_nullable
              as Result<Color>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsStateCopyWith<$Res>
    implements $DetailsStateCopyWith<$Res> {
  factory _$$_DetailsStateCopyWith(
          _$_DetailsState value, $Res Function(_$_DetailsState) then) =
      __$$_DetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<PokemonInfo> pokemonInfo,
      Result<PokemonSpecies> pokemonSpecies,
      Result<Color> averageColor});
}

/// @nodoc
class __$$_DetailsStateCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$_DetailsState>
    implements _$$_DetailsStateCopyWith<$Res> {
  __$$_DetailsStateCopyWithImpl(
      _$_DetailsState _value, $Res Function(_$_DetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonInfo = null,
    Object? pokemonSpecies = null,
    Object? averageColor = null,
  }) {
    return _then(_$_DetailsState(
      pokemonInfo: null == pokemonInfo
          ? _value.pokemonInfo
          : pokemonInfo // ignore: cast_nullable_to_non_nullable
              as Result<PokemonInfo>,
      pokemonSpecies: null == pokemonSpecies
          ? _value.pokemonSpecies
          : pokemonSpecies // ignore: cast_nullable_to_non_nullable
              as Result<PokemonSpecies>,
      averageColor: null == averageColor
          ? _value.averageColor
          : averageColor // ignore: cast_nullable_to_non_nullable
              as Result<Color>,
    ));
  }
}

/// @nodoc

class _$_DetailsState implements _DetailsState {
  _$_DetailsState(
      {required this.pokemonInfo,
      required this.pokemonSpecies,
      required this.averageColor});

  @override
  final Result<PokemonInfo> pokemonInfo;
  @override
  final Result<PokemonSpecies> pokemonSpecies;
  @override
  final Result<Color> averageColor;

  @override
  String toString() {
    return 'DetailsState(pokemonInfo: $pokemonInfo, pokemonSpecies: $pokemonSpecies, averageColor: $averageColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsState &&
            (identical(other.pokemonInfo, pokemonInfo) ||
                other.pokemonInfo == pokemonInfo) &&
            (identical(other.pokemonSpecies, pokemonSpecies) ||
                other.pokemonSpecies == pokemonSpecies) &&
            (identical(other.averageColor, averageColor) ||
                other.averageColor == averageColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pokemonInfo, pokemonSpecies, averageColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsStateCopyWith<_$_DetailsState> get copyWith =>
      __$$_DetailsStateCopyWithImpl<_$_DetailsState>(this, _$identity);
}

abstract class _DetailsState implements DetailsState {
  factory _DetailsState(
      {required final Result<PokemonInfo> pokemonInfo,
      required final Result<PokemonSpecies> pokemonSpecies,
      required final Result<Color> averageColor}) = _$_DetailsState;

  @override
  Result<PokemonInfo> get pokemonInfo;
  @override
  Result<PokemonSpecies> get pokemonSpecies;
  @override
  Result<Color> get averageColor;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsStateCopyWith<_$_DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
