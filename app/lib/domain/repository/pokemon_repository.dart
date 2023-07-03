import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';

abstract class PokemonRepository {
  Future<Result<PokemonList>> getPokemonList();
  Future<Result<PokemonInfo>> getPokemonInfo({required String name});
}
