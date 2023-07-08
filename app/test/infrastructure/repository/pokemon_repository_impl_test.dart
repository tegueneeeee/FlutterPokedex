import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/repository/pokemon_repository.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_cache_datasource.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';
import 'package:app/infrastructure/repository/pokemon_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixture.dart';

class MockRemoteDataSource extends Mock implements PokemonRemoteDataSource {}

class MockCacheDataSource extends Mock implements PokemonCacheDataSource {}

void main() {
  late MockRemoteDataSource remoteDataSource;
  late MockCacheDataSource cacheDataSource;
  late PokemonRepository pokemonRepository;
  late Fixture fixture;
  late PokemonList tPokemonList;
  late PokemonInfo tPokemonInfo;
  late List<PokemonResult> tPokemonResults;

  setUp(
    () async {
      remoteDataSource = MockRemoteDataSource();
      cacheDataSource = MockCacheDataSource();
      pokemonRepository = PokemonRepositoryImpl(
        remoteDataSource,
        cacheDataSource,
      );
      fixture = Fixture();
      tPokemonList =
          PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson));
      tPokemonInfo =
          PokemonInfo.fromJson(fixture.readJsonFile(Fixture.pokemonInfoJson));
      tPokemonResults = tPokemonList.results;
    },
  );

  group(
    "getPokemonResults",
    () {
      test(
        "If the cache for Pokemon results is not empty, "
        "the Pokemon results should be fetched from the cache data source.",
        () async {
          // Arrage
          when(() => cacheDataSource.getPokemonResultsFromCache())
              .thenAnswer((_) async => tPokemonResults);
          // Act
          final pokemonResults = await pokemonRepository.getPokemonResults();
          final data = (pokemonResults as Success<List<PokemonResult>>).data;
          // Assert
          verify(() => cacheDataSource.getPokemonResultsFromCache()).called(1);
          verifyNoMoreInteractions(cacheDataSource);
          expect(pokemonResults, isA<Success<List<PokemonResult>>>());
          expect(data, tPokemonResults);
        },
      );
      test(
        "If the cache for Pokemon results encounters an exception, "
        "handling the failure of fetching Pokemon results.",
        () async {
          // Arrage
          when(() => cacheDataSource.getPokemonResultsFromCache())
              .thenThrow(Exception("test"));
          // Act
          final pokemonResults = await pokemonRepository.getPokemonResults();
          final message =
              (pokemonResults as Failure<List<PokemonResult>>).message;
          verify(() => cacheDataSource.getPokemonResultsFromCache()).called(1);
          verifyNoMoreInteractions(cacheDataSource);
          expect(pokemonResults, isA<Failure<List<PokemonResult>>>());
          expect(message, Exception("test").toString());
        },
      );

      test(
        "If the cache for Pokemon results is empty, "
        "the Pokemon results should be fetched from the remote data source, "
        "and set in the cache.",
        () async {
          // Arrange
          when(() => cacheDataSource.getPokemonResultsFromCache())
              .thenAnswer((_) async => List.empty());
          when(() => remoteDataSource.getPokemonList())
              .thenAnswer((_) async => tPokemonList);
          when(() => cacheDataSource.setPokemonResultsToCache(
              pokemonResults: tPokemonResults)).thenAnswer((_) async {});
          // Act
          final pokemonResults = await pokemonRepository.getPokemonResults();
          final data = (pokemonResults as Success<List<PokemonResult>>).data;
          // Assert
          verify(() => cacheDataSource.getPokemonResultsFromCache()).called(1);
          verify(() => remoteDataSource.getPokemonList()).called(1);
          verify(() => cacheDataSource.setPokemonResultsToCache(
              pokemonResults: tPokemonResults)).called(1);
          verifyNoMoreInteractions(cacheDataSource);
          verifyNoMoreInteractions(remoteDataSource);
          expect(pokemonResults, isA<Success<List<PokemonResult>>>());
          expect(data, tPokemonResults);
        },
      );

      test(
        "If the remote for Pokemon results encounters an exception, "
        "handling the failure of fetching Pokemon results.",
        () async {
          // Arrange
          when(() => cacheDataSource.getPokemonResultsFromCache())
              .thenAnswer((_) async => List.empty());
          when(() => remoteDataSource.getPokemonList())
              .thenThrow(Exception("test"));
          when(() => cacheDataSource.setPokemonResultsToCache(
              pokemonResults: tPokemonResults)).thenAnswer((_) async {});
          // Act
          final pokemonResults = await pokemonRepository.getPokemonResults();
          final message =
              (pokemonResults as Failure<List<PokemonResult>>).message;
          // Assert
          verify(() => cacheDataSource.getPokemonResultsFromCache()).called(1);
          verify(() => remoteDataSource.getPokemonList()).called(1);
          verifyNoMoreInteractions(cacheDataSource);
          verifyNoMoreInteractions(remoteDataSource);
          expect(pokemonResults, isA<Failure<List<PokemonResult>>>());
          expect(message, Exception("test").toString());
        },
      );
    },
  );
}
