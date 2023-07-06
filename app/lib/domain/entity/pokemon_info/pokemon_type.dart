import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
class PokemonType with _$PokemonType {
  factory PokemonType({
    required String name,
    required String url,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}
