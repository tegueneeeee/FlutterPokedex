import 'package:app/core/result.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:app/presentation/home/home_event.dart';
import 'package:app/presentation/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
    super.state,
    this.getPokemonListUseCase,
    this.getPokemonInfosUseCase,
  ) {
    // _getPokemonList();
  }

  void onEvent(HomeEvent event) {
    final _ = switch (event) {
      GetPokemonList() => _getPokemonList(),
    };
  }

  final GetPokemonListUseCase getPokemonListUseCase;
  final GetPokemonInfoUseCase getPokemonInfosUseCase;

  void _getPokemonList() async {
    state = state.copyWith(pokemonList: Loading());
    final result = await getPokemonListUseCase();
    state = state.copyWith(pokemonList: result);
  }
}
