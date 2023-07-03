import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/repository/pokemon_repository.dart';

class GetPokemonInfoUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonInfoUseCase(this.pokemonRepository);

  Future<Result<PokemonInfo>> call({
    required String name,
  }) async {
    final result = await pokemonRepository.getPokemonInfo(name: name);
    return result;
  }
}
