import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/infrastructure/api/poke_api_service.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_remote_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture.dart';

class MockPokeApiService extends Mock implements PokeApiService {}

void main() {
  late MockPokeApiService pokeApiService;
  late PokemonRemoteDataSource dataSource;
  final PokemonList tPokemonUrl = PokemonList.fromJson(
    fixture(pokemonJson),
  );

  setUp(
    () async {
      pokeApiService = MockPokeApiService();
      dataSource = PokemonRemoteDataSourceImpl(pokeApiService);
    },
  );

  group(
    "getPokemonUrl",
    () {
      test(
        "",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenAnswer((_) async => tPokemonUrl);
          // Act
          dataSource.getPokemonList();
          // Assert
          verify(() => pokeApiService.getPokemonList()).called(1);
          verifyNoMoreInteractions(pokeApiService);
        },
      );
      test(
        "",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonList(),
          ).thenAnswer((_) async => tPokemonUrl);
          // Act
          final result = await dataSource.getPokemonList();
          final data = (result as Success<PokemonList>).data;
          // Assert
          expect(result, isA<Success<PokemonList>>());
          expect(
            data,
            tPokemonUrl,
          );
        },
      );
    },
  );
}
