import 'package:app/core/result.dart';
import 'package:app/domain/usecase/image_provider/get_image_provider_average_color_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_remote_datasource_impl.dart';
import 'package:app/infrastructure/repository/pokemon_repository_impl.dart';
import 'package:app/presentation/details/details_state.dart';
import 'package:app/presentation/details/details_view_model.dart';
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
final getImageProviderAverageColorUseCaseProvider = Provider(
  (_) {
    return GetImageProviderAverageColorUseCase();
  },
);

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) {
    final getPokemonListUseCase = ref.watch(getPokemonListUseCaseProvider);
    final state = HomeState(
      pokemonList: Loading(),
    );
    return HomeViewModel(
      state,
      getPokemonListUseCase,
    );
  },
);

final detailsViewModelProvider =
    StateNotifierProvider<DetailsViewModel, DetailsState>(
  (ref) {
    final getPokemonInfoUseCase = ref.watch(getPokemonInfoUseCaseProvider);
    final getImageProviderAverageColorUseCase =
        ref.watch(getImageProviderAverageColorUseCaseProvider);
    final state = DetailsState(
      pokemonInfo: Loading(),
      averageColor: Loading(),
    );
    return DetailsViewModel(
      state,
      getPokemonInfoUseCase,
      getImageProviderAverageColorUseCase,
    );
  },
);
