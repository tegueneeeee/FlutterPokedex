import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/repository/pokemon_repository.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository pokemonRepository;
  late GetPokemonListUseCase getPokemonListUseCase;
  late Fixture fixture;
  late PokemonList tPokemonList;

  setUp(() async {
    pokemonRepository = MockPokemonRepository();
    getPokemonListUseCase = GetPokemonListUseCase(pokemonRepository);
    fixture = Fixture();
    tPokemonList =
        PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson));
  });

  group(
    'call',
    () {
      test(
        "Should fetch pokemon list from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonResults(),
          ).thenAnswer(
            (_) async => Result.success(data: tPokemonList.results),
          );
          // Act
          getPokemonListUseCase();
          // Assert
          verify(() => pokemonRepository.getPokemonResults()).called(1);
          verifyNoMoreInteractions(pokemonRepository);
        },
      );

      test(
        "Should handle suceess when fetching Pokemon list from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonResults(),
          ).thenAnswer(
            (_) async => Result.success(data: tPokemonList.results),
          );
          // Act
          final result = await getPokemonListUseCase();
          final data = (result as Success<List<PokemonResult>>).data;
          // Assert
          expect(result, isA<Success<List<PokemonResult>>>());
          expect(data, tPokemonList.results);
          expect(data[0].name, "bulbasaur");
          expect(data[0].url, "https://pokeapi.co/api/v2/pokemon/1/");
        },
      );

      test(
        "Should handle failure when fetching Pokemon list from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonResults(),
          ).thenAnswer(
            (_) async => Result.failure(
              message: "test",
              exception: DioException.badResponse(
                statusCode: 404,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(),
                ),
              ),
            ),
          );
          // Act
          // Assert
          final result = await getPokemonListUseCase();
          final message = (result as Failure<List<PokemonResult>>).message;
          // Assert
          expect(result, isA<Failure<List<PokemonResult>>>());
          expect(message, "test");
        },
      );
    },
  );
}
