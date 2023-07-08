import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';
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
  late PokemonRemoteDataSource pokemonRemoteDataSource;
  late Fixture fixture;
  late PokemonList tPokemonList;
  late PokemonInfo tPokemonInfo;
  late PokemonSpecies tPokemonSpecies;
  setUp(
    () async {
      pokeApiService = MockPokeApiService();
      pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(pokeApiService);
      fixture = Fixture();
      tPokemonList =
          PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson));
      tPokemonInfo =
          PokemonInfo.fromJson(fixture.readJsonFile(Fixture.pokemonInfoJson));
      tPokemonSpecies = PokemonSpecies.fromJson(
          fixture.readJsonFile(Fixture.pokemonSpeciesJson));
    },
  );

  group(
    "Pokemon list",
    () {
      test(
        "If the pokeApi request for Pokemon list is successful, "
        "the expected behavior shuold be to fetch the Pokemon list from the pokeApi",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenAnswer((_) async => tPokemonList);
          // Act
          final data = await pokemonRemoteDataSource.getPokemonList();
          // Assert
          verify(() => pokeApiService.getPokemonList()).called(1);
          verifyNoMoreInteractions(pokeApiService);
          expect(data, tPokemonList);
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
        "If the pokeApi request for Pokemon list encounters an exception, "
        "the expected behavior shuold be to retrun the exception",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenThrow(
            Exception("test"),
          );
          // Act
          try {
            await pokemonRemoteDataSource.getPokemonList();
          } on Exception catch (e) {
            // Assert
            expect(e, isA<Exception>());
            expect(e.toString(), Exception("test").toString());
          }
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
          pokemonRemoteDataSource.getPokemonInfo(name: "test");
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
          final result =
              await pokemonRemoteDataSource.getPokemonInfo(name: "test");
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
          final result =
              await pokemonRemoteDataSource.getPokemonInfo(name: "test");
          final message = (result as Failure<PokemonInfo>).message;
          // Assert
          expect(result, isA<Failure<PokemonInfo>>());
          expect(message,
              PokemonRemoteDataSourceImpl.getPokemonInfoFailureMessage);
        },
      );
    },
  );

  group(
    "getPokemonSpecies",
    () {
      test(
        "Should fetch Pokemon Species from the pokeApi",
        () async {
          // Arrage
          when(
            () => pokeApiService.getPokemonSpecies(name: "test"),
          ).thenAnswer((_) async => tPokemonSpecies);
          // Act
          pokemonRemoteDataSource.getPokemonSpecies(name: "test");
          // Assert
          verify(() => pokeApiService.getPokemonSpecies(name: "test"))
              .called(1);
          verifyNoMoreInteractions(pokeApiService);
        },
      );

      test(
        "Should handle suceess when fetching pokemon species from the pokeApi",
        () async {
          // Arrage
          when(
            () => pokeApiService.getPokemonSpecies(name: "test"),
          ).thenAnswer((_) async => tPokemonSpecies);
          // Act
          final result =
              await pokemonRemoteDataSource.getPokemonSpecies(name: "test");
          final data = (result as Success<PokemonSpecies>).data;
          // Assert
          expect(result, isA<Success<PokemonSpecies>>());
          expect(data, tPokemonSpecies);
          expect(
            data.flavorTexts[3].flavorText,
            "The seed on its\nback is filled\nwith nutrients.\fThe seed grows\nsteadily larger as\nits body grows.",
          );
        },
      );
      test(
        "Should handle failure when fetching pokemon species from the pokeApi",
        () async {
          // Arrage
          when(
            () => pokeApiService.getPokemonSpecies(name: "test"),
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
          final result =
              await pokemonRemoteDataSource.getPokemonSpecies(name: "test");
          final message = (result as Failure<PokemonSpecies>).message;
          // Assert
          expect(result, isA<Failure<PokemonSpecies>>());
          expect(message,
              PokemonRemoteDataSourceImpl.getPokemonSpeciesFailureMessage);
        },
      );
    },
  );
}
