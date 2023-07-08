import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';

abstract class PokemonRepository {
  Future<Result<List<PokemonResult>>> getPokemonResults();
  Future<Result<PokemonInfo>> getPokemonInfo({required String name});
  Future<Result<PokemonSpecies>> getPokemonSpecies({required String name});
}
