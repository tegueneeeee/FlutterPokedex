import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_flavor_text.freezed.dart';
part 'pokemon_flavor_text.g.dart';

@freezed
class PokemonFlavorText with _$PokemonFlavorText {
  factory PokemonFlavorText({
    @JsonKey(name: "flavor_text") required String flavorText,
  }) = _PokemonFlavorText;

  factory PokemonFlavorText.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavorTextFromJson(json);
}
