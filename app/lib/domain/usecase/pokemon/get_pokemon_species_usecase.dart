import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';
import 'package:app/domain/repository/pokemon_repository.dart';

class GetPokemonSpeciesUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonSpeciesUseCase(this.pokemonRepository);

  Future<Result<PokemonSpecies>> call({
    required String name,
  }) async {
    final result = pokemonRepository.getPokemonSpecies(name: name);
    return result;
  }
}
