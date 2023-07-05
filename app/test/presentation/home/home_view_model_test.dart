import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:app/presentation/home/home_event.dart';
import 'package:app/presentation/home/home_state.dart';
import 'package:app/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixture.dart';

class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}

void main() {
  late MockGetPokemonListUseCase getPokemonListUseCase;
  late HomeState homeState;
  late HomeViewModel homeViewModel;
  late Fixture fixture;
  late PokemonList tPokemonList;

  setUp(
    () async {
      getPokemonListUseCase = MockGetPokemonListUseCase();
      homeState = HomeState(pokemonList: Loading());
      homeViewModel = HomeViewModel(homeState, getPokemonListUseCase);
      fixture = Fixture();
      tPokemonList = PokemonList.fromJson(fixture(Fixture.pokemonJson));
    },
  );

  group(
    "GetPokemonList",
    () {
      test(
        "Should fetch pokemon list from the getPokemonListUseCase",
        () async {
          // Arrange
          when(() => getPokemonListUseCase()).thenAnswer(
            (_) async => Success(data: tPokemonList),
          );
          // Act
          homeViewModel.onEvent(GetPokemonList());
          // Assert
          verify(() => getPokemonListUseCase()).called(1);
          verifyNoMoreInteractions(getPokemonListUseCase);
        },
      );

      test(
        "Should handle suceess when fetching Pokemon list from the getPokemonListUseCase",
        () async {
          // Arrange
          when(() => getPokemonListUseCase()).thenAnswer(
            (_) async => Success(data: tPokemonList),
          );
          // Act
          // expect(homeViewModel.debugState, HomeState(pokemonList: Loading()));
          homeViewModel.onEvent(GetPokemonList());
          expect(homeViewModel.debugState, HomeState(pokemonList: Loading()));
          // final result = homeState.pokemonList;
          // final data = (result as Success<PokemonList>).data;
          // Assert
          // expect(result, isA<Success<PokemonList>>());
          // expect(
          // data,
          // tPokemonList,
          // );
        },
      );
    },
  );
}
