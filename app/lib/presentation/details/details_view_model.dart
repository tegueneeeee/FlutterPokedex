import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/usecase/image_provider/get_image_provider_average_color_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_species_usecase.dart';
import 'package:app/presentation/details/details_event.dart';
import 'package:app/presentation/details/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsViewModel extends StateNotifier<DetailsState> {
  DetailsViewModel(
    super.state,
    this.getPokemonInfoUseCase,
    this.getImageProviderAverageColorUseCse,
    this.getPokemonSpeciesUseCase,
  );

  final GetPokemonInfoUseCase getPokemonInfoUseCase;
  final GetImageProviderAverageColorUseCase getImageProviderAverageColorUseCse;
  final GetPokemonSpeciesUseCase getPokemonSpeciesUseCase;

  Future<void> onEvent(DetailsEvent event) async {
    final _ = switch (event) {
      GetpokemonInfo(pokemon: final pokemon) => _getPokemonInfo(pokemon),
      SetAverageColor(imageProvider: final imageProvider) =>
        _setAverageColor(imageProvider),
      GetPokemonSpecies(name: final name) => _getPokemonSpecies(name),
    };
  }

  void _getPokemonInfo(PokemonResult pokemon) async {
    state = state.copyWith(pokemonInfo: Loading());
    final result = await getPokemonInfoUseCase(name: pokemon.name);
    state = state.copyWith(pokemonInfo: result);
  }

  void _setAverageColor(ImageProvider imageProvider) async {
    final averageColor =
        await getImageProviderAverageColorUseCse(imageProvider: imageProvider);
    state = state.copyWith(averageColor: averageColor);
  }

  void _getPokemonSpecies(String name) async {
    state = state.copyWith(pokemonSpecies: Loading());
    final result = await getPokemonSpeciesUseCase(name: name);
    state = state.copyWith(pokemonSpecies: result);
  }
}
