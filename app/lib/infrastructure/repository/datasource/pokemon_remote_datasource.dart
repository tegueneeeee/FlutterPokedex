import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';

abstract class PokemonRemoteDataSource {
  Future<Result<PokemonList>> getPokemonList();
  Future<Result<PokemonInfo>> getPokemonInfo({required String name});
  Future<Result<PokemonSpecies>> getPokemonSpecies({required String name});
}
