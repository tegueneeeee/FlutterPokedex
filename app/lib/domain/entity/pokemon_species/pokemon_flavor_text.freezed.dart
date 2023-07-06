// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_flavor_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonFlavorText _$PokemonFlavorTextFromJson(Map<String, dynamic> json) {
  return _PokemonFlavorText.fromJson(json);
}

/// @nodoc
mixin _$PokemonFlavorText {
  @JsonKey(name: "flavor_text")
  String get flavorText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonFlavorTextCopyWith<PokemonFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonFlavorTextCopyWith<$Res> {
  factory $PokemonFlavorTextCopyWith(
          PokemonFlavorText value, $Res Function(PokemonFlavorText) then) =
      _$PokemonFlavorTextCopyWithImpl<$Res, PokemonFlavorText>;
  @useResult
  $Res call({@JsonKey(name: "flavor_text") String flavorText});
}

/// @nodoc
class _$PokemonFlavorTextCopyWithImpl<$Res, $Val extends PokemonFlavorText>
    implements $PokemonFlavorTextCopyWith<$Res> {
  _$PokemonFlavorTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
  }) {
    return _then(_value.copyWith(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonFlavorTextCopyWith<$Res>
    implements $PokemonFlavorTextCopyWith<$Res> {
  factory _$$_PokemonFlavorTextCopyWith(_$_PokemonFlavorText value,
          $Res Function(_$_PokemonFlavorText) then) =
      __$$_PokemonFlavorTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "flavor_text") String flavorText});
}

/// @nodoc
class __$$_PokemonFlavorTextCopyWithImpl<$Res>
    extends _$PokemonFlavorTextCopyWithImpl<$Res, _$_PokemonFlavorText>
    implements _$$_PokemonFlavorTextCopyWith<$Res> {
  __$$_PokemonFlavorTextCopyWithImpl(
      _$_PokemonFlavorText _value, $Res Function(_$_PokemonFlavorText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
  }) {
    return _then(_$_PokemonFlavorText(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonFlavorText implements _PokemonFlavorText {
  _$_PokemonFlavorText(
      {@JsonKey(name: "flavor_text") required this.flavorText});

  factory _$_PokemonFlavorText.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonFlavorTextFromJson(json);

  @override
  @JsonKey(name: "flavor_text")
  final String flavorText;

  @override
  String toString() {
    return 'PokemonFlavorText(flavorText: $flavorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonFlavorText &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flavorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonFlavorTextCopyWith<_$_PokemonFlavorText> get copyWith =>
      __$$_PokemonFlavorTextCopyWithImpl<_$_PokemonFlavorText>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonFlavorTextToJson(
      this,
    );
  }
}

abstract class _PokemonFlavorText implements PokemonFlavorText {
  factory _PokemonFlavorText(
          {@JsonKey(name: "flavor_text") required final String flavorText}) =
      _$_PokemonFlavorText;

  factory _PokemonFlavorText.fromJson(Map<String, dynamic> json) =
      _$_PokemonFlavorText.fromJson;

  @override
  @JsonKey(name: "flavor_text")
  String get flavorText;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonFlavorTextCopyWith<_$_PokemonFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}
