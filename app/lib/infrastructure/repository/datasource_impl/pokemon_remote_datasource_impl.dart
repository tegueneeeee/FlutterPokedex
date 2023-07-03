import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final PokeApiService pokeApiService;

  PokemonRemoteDataSourceImpl(this.pokeApiService);

  @override
  Future<Result<PokemonList>> getPokemonList() async {
    try {
      final response = await pokeApiService.getPokemonList();
      return Success(data: response);
    } on Exception catch (e) {
      return Failure(message: e.toString(), exception: e);
    }
  }

  @override
  Future<Result<PokemonInfo>> getPokemonInfo({
    required String name,
  }) async {
    try {
      final response = await pokeApiService.getPokemonInfo(name: name);
      return Success(data: response);
    } on Exception catch (e) {
      return Failure(message: e.toString(), exception: e);
    }
  }
}
