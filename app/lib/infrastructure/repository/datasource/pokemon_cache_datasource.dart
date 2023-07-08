import 'package:app/domain/entity/pokemon/pokemon_result.dart';

abstract class PokemonCacheDataSource {
  Future<List<PokemonResult>> getPokemonResultsFromCache();
  Future<void> setPokemonResultsToCache({
    required List<PokemonResult> pokemonResults,
  });
}
