// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonSpecies _$PokemonSpeciesFromJson(Map<String, dynamic> json) {
  return _PokemonSpecies.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpecies {
  @JsonKey(name: "flavor_text_entries")
  List<PokemonFlavorText> get flavorTexts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonSpeciesCopyWith<PokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpeciesCopyWith<$Res> {
  factory $PokemonSpeciesCopyWith(
          PokemonSpecies value, $Res Function(PokemonSpecies) then) =
      _$PokemonSpeciesCopyWithImpl<$Res, PokemonSpecies>;
  @useResult
  $Res call(
      {@JsonKey(name: "flavor_text_entries")
      List<PokemonFlavorText> flavorTexts});
}

/// @nodoc
class _$PokemonSpeciesCopyWithImpl<$Res, $Val extends PokemonSpecies>
    implements $PokemonSpeciesCopyWith<$Res> {
  _$PokemonSpeciesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorTexts = null,
  }) {
    return _then(_value.copyWith(
      flavorTexts: null == flavorTexts
          ? _value.flavorTexts
          : flavorTexts // ignore: cast_nullable_to_non_nullable
              as List<PokemonFlavorText>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonSpeciesCopyWith<$Res>
    implements $PokemonSpeciesCopyWith<$Res> {
  factory _$$_PokemonSpeciesCopyWith(
          _$_PokemonSpecies value, $Res Function(_$_PokemonSpecies) then) =
      __$$_PokemonSpeciesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "flavor_text_entries")
      List<PokemonFlavorText> flavorTexts});
}

/// @nodoc
class __$$_PokemonSpeciesCopyWithImpl<$Res>
    extends _$PokemonSpeciesCopyWithImpl<$Res, _$_PokemonSpecies>
    implements _$$_PokemonSpeciesCopyWith<$Res> {
  __$$_PokemonSpeciesCopyWithImpl(
      _$_PokemonSpecies _value, $Res Function(_$_PokemonSpecies) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorTexts = null,
  }) {
    return _then(_$_PokemonSpecies(
      flavorTexts: null == flavorTexts
          ? _value._flavorTexts
          : flavorTexts // ignore: cast_nullable_to_non_nullable
              as List<PokemonFlavorText>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonSpecies implements _PokemonSpecies {
  _$_PokemonSpecies(
      {@JsonKey(name: "flavor_text_entries")
      required final List<PokemonFlavorText> flavorTexts})
      : _flavorTexts = flavorTexts;

  factory _$_PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonSpeciesFromJson(json);

  final List<PokemonFlavorText> _flavorTexts;
  @override
  @JsonKey(name: "flavor_text_entries")
  List<PokemonFlavorText> get flavorTexts {
    if (_flavorTexts is EqualUnmodifiableListView) return _flavorTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flavorTexts);
  }

  @override
  String toString() {
    return 'PokemonSpecies(flavorTexts: $flavorTexts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonSpecies &&
            const DeepCollectionEquality()
                .equals(other._flavorTexts, _flavorTexts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_flavorTexts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonSpeciesCopyWith<_$_PokemonSpecies> get copyWith =>
      __$$_PokemonSpeciesCopyWithImpl<_$_PokemonSpecies>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonSpeciesToJson(
      this,
    );
  }
}

abstract class _PokemonSpecies implements PokemonSpecies {
  factory _PokemonSpecies(
      {@JsonKey(name: "flavor_text_entries")
      required final List<PokemonFlavorText> flavorTexts}) = _$_PokemonSpecies;

  factory _PokemonSpecies.fromJson(Map<String, dynamic> json) =
      _$_PokemonSpecies.fromJson;

  @override
  @JsonKey(name: "flavor_text_entries")
  List<PokemonFlavorText> get flavorTexts;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonSpeciesCopyWith<_$_PokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}
