import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_url/pokemon_url.dart';
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
  final PokemonUrl tPokemonUrl = PokemonUrl.fromJson(
    fixture(pokemon_url_json),
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
            () => pokeApiService.getPokemonUrl(),
          ).thenAnswer((_) async => tPokemonUrl);
          // Act
          dataSource.getPokemonUrl();
          // Assert
          verify(() => pokeApiService.getPokemonUrl()).called(1);
          verifyNoMoreInteractions(pokeApiService);
        },
      );
      test(
        "",
        () async {
          // Arrange
          when(
            () => pokeApiService.getPokemonUrl(),
          ).thenAnswer((_) async => tPokemonUrl);
          // Act
          final result = await dataSource.getPokemonUrl();
          final data = (result as Success<PokemonUrl>).data;
          // Assert
          expect(result, isA<Success<PokemonUrl>>());
          expect(
            data,
            tPokemonUrl,
          );
        },
      );
    },
  );
}
