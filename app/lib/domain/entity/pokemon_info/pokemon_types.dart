import 'package:app/domain/entity/pokemon_info/pokemon_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_types.freezed.dart';
part 'pokemon_types.g.dart';

@freezed
class PokemonTypes with _$PokemonTypes {
  factory PokemonTypes({
    required int slot,
    required PokemonType type,
  }) = _PokemonTypes;

  factory PokemonTypes.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypesFromJson(json);
}
