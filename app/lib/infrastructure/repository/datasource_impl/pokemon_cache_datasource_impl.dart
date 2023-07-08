import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_cache_datasource.dart';

class PokemonCacheDataSourceImpl implements PokemonCacheDataSource {
  List<PokemonResult> _pokemonResults = [];

  @override
  Future<List<PokemonResult>> getPokemonResultsFromCache() async {
    return _pokemonResults;
  }

  @override
  Future<void> setPokemonResultsToCache({
    required List<PokemonResult> pokemonResults,
  }) async {
    _pokemonResults = List<PokemonResult>.from(pokemonResults);
  }
}
