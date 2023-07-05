import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
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
    tPokemonList = PokemonList.fromJson(fixture(Fixture.pokemonJson));
  });

  group(
    'call',
    () {
      test(
        "Should fetch pokemon list from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonList(),
          ).thenAnswer(
            (_) async => Result.success(data: tPokemonList),
          );
          // Act
          getPokemonListUseCase();
          // Assert
          verify(() => pokemonRepository.getPokemonList()).called(1);
          verifyNoMoreInteractions(pokemonRepository);
        },
      );

      test(
        "Should handle suceess when fetching Pokemon list from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonList(),
          ).thenAnswer(
            (_) async => Result.success(data: tPokemonList),
          );
          // Act
          final result = await getPokemonListUseCase();
          final data = (result as Success<PokemonList>).data;
          // Assert
          expect(result, isA<Success<PokemonList>>());
          expect(
            data,
            tPokemonList,
          );
          expect(data.count, 1281);
          expect(
            data.next,
            "https://pokeapi.co/api/v2/pokemon?offset=151&limit=151",
          );
          expect(data.previous, null);
          expect(data.results[0].name, "bulbasaur");
          expect(data.results[0].url, "https://pokeapi.co/api/v2/pokemon/1/");
        },
      );

      test(
        "Should handle failure when fetching Pokemon list from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonList(),
          ).thenAnswer(
            (_) async => Result.failure(
              message: "Failure getPokemonList",
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
          final message = (result as Failure<PokemonList>).message;
          // Assert
          expect(result, isA<Failure<PokemonList>>());
          expect(
            message,
            "Failure getPokemonList",
          );
        },
      );
    },
  );
}
