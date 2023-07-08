import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/db/pokemon_result_dao.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_local_datasource.dart';

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final PokemonResultDAO pokemonResultDAO;

  PokemonLocalDataSourceImpl(this.pokemonResultDAO);
  @override
  Future<List<PokemonResult>> getPokemonResultsFromDB() async {
    return pokemonResultDAO.getPokemonResults();
  }

  @override
  Future<void> savePokemonResultsToDB({
    required List<PokemonResult> pokemonResults,
  }) async {
    pokemonResultDAO.addPokemonResults(pokemonResults: pokemonResults);
  }

  @override
  Future<void> clearAll() async {
    pokemonResultDAO.clear();
  }
}
