import 'package:app/core/result.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/presentation/details/details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsViewModel extends StateNotifier<DetailsState> {
  DetailsViewModel(
    super.state,
    this.getPokemonInfoUseCase,
  );

  final GetPokemonInfoUseCase getPokemonInfoUseCase;

  void getPokemonInfo(String name) async {
    state = state.copyWith(pokemonInfo: Loading());
    final result = await getPokemonInfoUseCase(name: name);
    state = state.copyWith(pokemonInfo: result);
  }
}
