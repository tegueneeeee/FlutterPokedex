import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/repository/pokemon_repository.dart';

class GetPokemonListUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonListUseCase(this.pokemonRepository);

  Future<Result<List<PokemonResult>>> call() async {
    final result = await pokemonRepository.getPokemonResults();
    return result;
  }
}
