import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_url/pokemon_url.dart';

abstract class PokemonRemoteDataSource {
  Future<Result<PokemonUrl>> getPokemonUrl();
}
