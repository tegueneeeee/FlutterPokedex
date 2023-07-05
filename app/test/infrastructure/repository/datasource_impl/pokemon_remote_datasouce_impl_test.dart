import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_remote_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture.dart';

class MockPokeApiService extends Mock implements PokeApiService {}

void main() {
  late MockPokeApiService pokeApiService;
  late PokemonRemoteDataSource dataSource;
  late Fixture fixture;
  late PokemonList tPokemonList;

  setUp(
    () async {
      pokeApiService = MockPokeApiService();
      dataSource = PokemonRemoteDataSourceImpl(pokeApiService);
      fixture = Fixture();
      tPokemonList = PokemonList.fromJson(fixture(Fixture.pokemonJson));
    },
  );

  group(
    "getPokemonList",
    () {
      test(
        "Should fetch Pokemon list from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenAnswer((_) async => tPokemonList);
          // Act
          dataSource.getPokemonList();
          // Assert
          verify(() => pokeApiService.getPokemonList()).called(1);
          verifyNoMoreInteractions(pokeApiService);
        },
      );
      test(
        "Should handle suceess when fetching Pokemon list from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenAnswer((_) async => tPokemonList);
          // Act
          final result = await dataSource.getPokemonList();
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
        "Should handle failure when fetching Pokemon list from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenThrow(
            DioException.badResponse(
              statusCode: 404,
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(),
              ),
            ),
          );
          // Act
          final result = await dataSource.getPokemonList();
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
