import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final PokeApiService pokeApiService;

  PokemonRemoteDataSourceImpl(this.pokeApiService);

  static const getPokemonInfoFailureMessage = "getPokemonInfo Failure";
  static const getPokemonSpeciesFailureMessage = "getPokemonSpecies Failure";

  @override
  Future<PokemonList> getPokemonList() async {
    return await pokeApiService.getPokemonList();
  }

  @override
  Future<Result<PokemonInfo>> getPokemonInfo({
    required String name,
  }) async {
    try {
      final response = await pokeApiService.getPokemonInfo(name: name);
      return Result.success(data: response);
    } on Exception catch (e) {
      return Result.failure(
          message: getPokemonInfoFailureMessage, exception: e);
    }
  }

  @override
  Future<Result<PokemonSpecies>> getPokemonSpecies({
    required String name,
  }) async {
    try {
      final response = await pokeApiService.getPokemonSpecies(name: name);
      return Result.success(data: response);
    } on Exception catch (e) {
      return Result.failure(
          message: getPokemonSpeciesFailureMessage, exception: e);
    }
  }
}
