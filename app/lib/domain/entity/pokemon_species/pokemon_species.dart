import 'package:app/domain/entity/pokemon_species/pokemon_flavor_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species.freezed.dart';
part 'pokemon_species.g.dart';

@freezed
class PokemonSpecies with _$PokemonSpecies {
  factory PokemonSpecies({
    @JsonKey(name: "flavor_text_entries")
    required List<PokemonFlavorText> flavorTexts,
  }) = _PokemonSpecies;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);
}
