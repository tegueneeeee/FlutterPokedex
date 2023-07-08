import 'package:app/domain/entity/pokemon/pokemon_result.dart';

abstract class PokemonLocalDataSource {
  Future<List<PokemonResult>> getPokemonResultsFromDB();
  Future<void> savePokemonResultsToDB({
    required List<PokemonResult> pokemonResults,
  });
  Future<void> clearAll();
}
