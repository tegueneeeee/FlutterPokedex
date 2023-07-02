import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_url/pokemon_url.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final PokeApiService pokeApiService;

  PokemonRemoteDataSourceImpl(this.pokeApiService);
  @override
  Future<Result<PokemonUrl>> getPokemonUrl() async {
    try {
      final result = await pokeApiService.getPokemonUrl();
      return Success(data: result);
    } on Exception catch (e) {
      return Failure(message: e.toString());
    }
  }
}
