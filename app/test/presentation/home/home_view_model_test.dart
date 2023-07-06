import 'package:app/core/result.dart';
import 'package:app/di/riverpod_setup.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:app/presentation/home/home_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixture.dart';

class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}

void main() {
  late MockGetPokemonListUseCase getPokemonListUseCase;
  late ProviderContainer providerContainer;
  late Fixture fixture;
  late PokemonList tPokemonList;

  setUp(
    () async {
      getPokemonListUseCase = MockGetPokemonListUseCase();
      providerContainer = ProviderContainer(
        overrides: [
          getPokemonListUseCaseProvider
              .overrideWithValue(getPokemonListUseCase),
        ],
      );
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
            (_) async => Result.success(data: tPokemonList),
          );
          // Act
          providerContainer.read(homeViewModelProvider.notifier);
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
            (_) async => Result.success(data: tPokemonList),
          );
          // Act
          final homeViewModel =
              providerContainer.read(homeViewModelProvider.notifier);
          await homeViewModel.onEvent(GetPokemonList());
          final state = providerContainer.read(homeViewModelProvider);
          final result = state.pokemonList;
          final data = (state.pokemonList as Success<PokemonList>).data;
          // Assert
          expect(result, isA<Success<PokemonList>>());
          expect(
            data,
            tPokemonList,
          );
        },
      );
    },
  );
}
