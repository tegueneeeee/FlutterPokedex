// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonList _$PokemonListFromJson(Map<String, dynamic> json) {
  return _PokemonList.fromJson(json);
}

/// @nodoc
mixin _$PokemonList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PokemonResult> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonListCopyWith<PokemonList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListCopyWith<$Res> {
  factory $PokemonListCopyWith(
          PokemonList value, $Res Function(PokemonList) then) =
      _$PokemonListCopyWithImpl<$Res, PokemonList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<PokemonResult> results});
}

/// @nodoc
class _$PokemonListCopyWithImpl<$Res, $Val extends PokemonList>
    implements $PokemonListCopyWith<$Res> {
  _$PokemonListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonListCopyWith<$Res>
    implements $PokemonListCopyWith<$Res> {
  factory _$$_PokemonListCopyWith(
          _$_PokemonList value, $Res Function(_$_PokemonList) then) =
      __$$_PokemonListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<PokemonResult> results});
}

/// @nodoc
class __$$_PokemonListCopyWithImpl<$Res>
    extends _$PokemonListCopyWithImpl<$Res, _$_PokemonList>
    implements _$$_PokemonListCopyWith<$Res> {
  __$$_PokemonListCopyWithImpl(
      _$_PokemonList _value, $Res Function(_$_PokemonList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$_PokemonList(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonList implements _PokemonList {
  _$_PokemonList(
      {required this.count,
      this.next,
      this.previous,
      required final List<PokemonResult> results})
      : _results = results;

  factory _$_PokemonList.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonListFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PokemonResult> _results;
  @override
  List<PokemonResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonList &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonListCopyWith<_$_PokemonList> get copyWith =>
      __$$_PokemonListCopyWithImpl<_$_PokemonList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonListToJson(
      this,
    );
  }
}

abstract class _PokemonList implements PokemonList {
  factory _PokemonList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<PokemonResult> results}) = _$_PokemonList;

  factory _PokemonList.fromJson(Map<String, dynamic> json) =
      _$_PokemonList.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PokemonResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonListCopyWith<_$_PokemonList> get copyWith =>
      throw _privateConstructorUsedError;
}
