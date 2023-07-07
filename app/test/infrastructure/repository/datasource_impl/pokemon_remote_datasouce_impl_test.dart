import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
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
  late PokemonInfo tPokemonInfo;

  setUp(
    () async {
      pokeApiService = MockPokeApiService();
      dataSource = PokemonRemoteDataSourceImpl(pokeApiService);
      fixture = Fixture();
      tPokemonList = PokemonList.fromJson(fixture(Fixture.pokemonListJson));
      tPokemonInfo = PokemonInfo.fromJson(fixture(Fixture.pokemonInfoJson));
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
            PokemonRemoteDataSourceImpl.getPokemonListFailureMessage,
          );
        },
      );
    },
  );

  group(
    "getPokemonInfo",
    () {
      test(
        "Should fetch Pokemon Info from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonInfo(name: "test"),
          ).thenAnswer((_) async => tPokemonInfo);
          // Act
          dataSource.getPokemonInfo(name: "test");
          // Assert
          verify(() => pokeApiService.getPokemonInfo(name: "test")).called(1);
          verifyNoMoreInteractions(pokeApiService);
        },
      );
      test(
        "Should handle suceess when fetching Pokemon Info from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonInfo(name: "test"),
          ).thenAnswer((_) async => tPokemonInfo);
          // Act
          final result = await dataSource.getPokemonInfo(name: "test");
          final data = (result as Success<PokemonInfo>).data;
          // Assert
          expect(result, isA<Success<PokemonInfo>>());
          expect(data, tPokemonInfo);
          expect(data.id, 1);
          expect(data.name, "bulbasaur");
          expect(data.height, 7);
          expect(data.weight, 69);
          expect(data.types[0].slot, 1);
          expect(data.types[0].type.name, "grass");
          expect(data.types[0].type.url, "https://pokeapi.co/api/v2/type/12/");
          expect(data.types[1].slot, 2);
          expect(data.types[1].type.name, "poison");
          expect(data.types[1].type.url, "https://pokeapi.co/api/v2/type/4/");
        },
      );

      test(
        "Should handle failure when fetching Pokemon info from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonInfo(name: "test"),
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
          final result = await dataSource.getPokemonInfo(name: "test");
          final message = (result as Failure<PokemonInfo>).message;
          // Assert
          expect(result, isA<Failure<PokemonInfo>>());
          expect(message,
              PokemonRemoteDataSourceImpl.getPokemonInfoFailureMessage);
        },
      );
    },
  );
}
