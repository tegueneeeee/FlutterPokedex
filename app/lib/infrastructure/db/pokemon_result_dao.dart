import 'package:app/domain/entity/pokemon/pokemon_result.dart';

abstract class PokemonResultDAO {
  Future<void> init();
  List<PokemonResult> getPokemonResults();
  void addPokemonResults({required List<PokemonResult> pokemonResults});
  Future<void> clear();
}
