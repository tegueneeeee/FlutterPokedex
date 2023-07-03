import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_result.freezed.dart';
part 'pokemon_result.g.dart';

@freezed
class PokemonResult with _$PokemonResult {
  PokemonResult._();

  factory PokemonResult({
    required String name,
    required String url,
  }) = _PokemonResult;

  factory PokemonResult.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultFromJson(json);

  String getImageUrl() {
    final index = url.split("/")[6];
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$index.png";
  }
}
