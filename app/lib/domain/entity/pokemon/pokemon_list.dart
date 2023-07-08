import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list.freezed.dart';
part 'pokemon_list.g.dart';

@freezed
class PokemonList with _$PokemonList {
  factory PokemonList({
    required int count,
    String? next,
    String? previous,
    required List<PokemonResult> results,
  }) = _PokemonList;

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      _$PokemonListFromJson(json);
}
