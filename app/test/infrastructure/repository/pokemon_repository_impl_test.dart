import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/repository/pokemon_repository.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';
import 'package:app/infrastructure/repository/pokemon_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixture.dart';

class MockRemoteDataSource extends Mock implements PokemonRemoteDataSource {}

void main() {
  late MockRemoteDataSource remoteDataSource;
  late PokemonRepository pokemonRepository;
  late Fixture fixture;
  late PokemonList tPokemonList;

  setUp(
    () async {
      remoteDataSource = MockRemoteDataSource();
      pokemonRepository = PokemonRepositoryImpl(remoteDataSource);
      fixture = Fixture();
      tPokemonList = PokemonList.fromJson(fixture(Fixture.pokemonJson));
    },
  );

  group(
    "getPokemonList",
    () {
      test(
        "Should fetch pokemon list from the remote data source",
        () async {
          // Arrange
          when(
            () => remoteDataSource.getPokemonList(),
          ).thenAnswer((_) async => Result.success(data: tPokemonList));
          // Act
          pokemonRepository.getPokemonList();
          // Assert
          verify(() => remoteDataSource.getPokemonList()).called(1);
          verifyNoMoreInteractions(remoteDataSource);
        },
      );

      test(
        "Should handle suceess when fetching Pokemon list from the remote data source",
        () async {
          // Arrange
          when(
            () => remoteDataSource.getPokemonList(),
          ).thenAnswer((_) async => Result.success(data: tPokemonList));
          // Act
          final result = await pokemonRepository.getPokemonList();
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
        "Should fetch Pokemon list the correct data with Success case",
        () async {
          // Arrange
          when(
            () => remoteDataSource.getPokemonList(),
          ).thenAnswer((_) async => Result.success(data: tPokemonList));
          // Act
          final result = await pokemonRepository.getPokemonList();
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
        "Should handle failure when fetching Pokemon list from the remote data source",
        () async {
          // Arrange
          when(
            () => remoteDataSource.getPokemonList(),
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
          final result = await pokemonRepository.getPokemonList();
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
