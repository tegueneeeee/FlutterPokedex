import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/db/pokemon_result_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PokemonResultDAOImpl implements PokemonResultDAO {
  final Box<PokemonResult> pokemonResultBox;

  PokemonResultDAOImpl(this.pokemonResultBox);

  @override
  Future<List<PokemonResult>> getPokemonResults() async {
    final pokemonResults = pokemonResultBox.toMap().values.toList();
    return pokemonResults;
  }

  @override
  Future<void> addPokemonResults({
    required List<PokemonResult> pokemonResults,
  }) async {
    pokemonResultBox.addAll(pokemonResults);
  }

  @override
  Future<void> clear() async {
    await pokemonResultBox.clear();
  }
}
