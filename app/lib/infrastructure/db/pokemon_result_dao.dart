import 'package:app/domain/entity/pokemon/pokemon_result.dart';

abstract class PokemonResultDAO {
  Future<List<PokemonResult>> getPokemonResults();
  Future<void> addPokemonResults({required List<PokemonResult> pokemonResults});
  Future<void> clear();
}
