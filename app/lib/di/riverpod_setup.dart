import 'package:app/core/result.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_remote_datasource_impl.dart';
import 'package:app/infrastructure/repository/pokemon_repository_impl.dart';
import 'package:app/presentation/home/home_state.dart';
import 'package:app/presentation/home/home_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokeApiServiceProvider = Provider(
  (_) {
    final dio = Dio();
    return PokeApiService(dio);
  },
);
final pokemonRemoteDataSourceProvider = Provider(
  (ref) {
    final pokeApiService = ref.watch(pokeApiServiceProvider);
    return PokemonRemoteDataSourceImpl(pokeApiService);
  },
);

final pokemonRepositoryProvider = Provider((ref) {
  final pokemonRemoteDateSource = ref.watch(pokemonRemoteDataSourceProvider);
  return PokemonRepositoryImpl(pokemonRemoteDateSource);
});

final getPokemonListUseCaseProvider = Provider((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return GetPokemonListUseCase(pokemonRepository);
});
final getPokemonInfoUseCaseProvider = Provider((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return GetPokemonInfoUseCase(pokemonRepository);
});

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) {
    final getPokemonListUseCase = ref.watch(getPokemonListUseCaseProvider);
    final getPokemonInfoUseCase = ref.watch(getPokemonInfoUseCaseProvider);
    final state = HomeState(
      pokemonList: Loading(),
    );
    return HomeViewModel(
      state,
      getPokemonListUseCase,
      getPokemonInfoUseCase,
    );
  },
);
