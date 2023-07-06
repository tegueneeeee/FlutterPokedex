import 'package:app/core/result.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:app/presentation/home/home_event.dart';
import 'package:app/presentation/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
    super.state,
    this.getPokemonListUseCase,
  ) {
    _getPokemonList();
  }

  final GetPokemonListUseCase getPokemonListUseCase;

  Future<void> onEvent(HomeEvent event) async {
    final _ = switch (event) {
      GetPokemonList() => _getPokemonList(),
    };
  }

  void _getPokemonList() async {
    state = state.copyWith(pokemonList: Loading());
    final result = await getPokemonListUseCase();
    state = state.copyWith(pokemonList: result);
  }
}
