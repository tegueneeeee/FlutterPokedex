import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/db/pokemon_result_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PokemonResultDAOImpl implements PokemonResultDAO {
  late final Box<PokemonResult> pokemonResultBox;
  @override
  Future<void> init() async {
    await Hive.initFlutter('pokemonDB');
    Hive.registerAdapter(PokemonResultAdapter());
    pokemonResultBox = await Hive.openBox<PokemonResult>("pokemonResult");
  }

  @override
  List<PokemonResult> getPokemonResults() {
    final pokemonList = pokemonResultBox.toMap().values.toList();
    return pokemonList;
  }

  @override
  void addPokemonResults({
    required List<PokemonResult> pokemonResults,
  }) {
    pokemonResultBox.addAll(pokemonResults);
  }

  @override
  Future<void> clear() async {
    await pokemonResultBox.clear();
  }
}
