import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/repository/pokemon_repository.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_remote_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository pokemonRepository;
  late GetPokemonInfoUseCase getPokemonInfoUseCase;
  late Fixture fixture;
  late PokemonInfo tPokemonInfo;

  setUp(() async {
    pokemonRepository = MockPokemonRepository();
    getPokemonInfoUseCase = GetPokemonInfoUseCase(pokemonRepository);
    fixture = Fixture();
    tPokemonInfo = PokemonInfo.fromJson(fixture(Fixture.pokemonInfoJson));
  });

  group(
    'call',
    () {
      test(
        "Should fetch pokemon info from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonInfo(name: "test"),
          ).thenAnswer(
            (_) async => Result.success(data: tPokemonInfo),
          );
          // Act
          getPokemonInfoUseCase(name: "test");
          // Assert
          verify(() => pokemonRepository.getPokemonInfo(name: "test"))
              .called(1);
          verifyNoMoreInteractions(pokemonRepository);
        },
      );

      test(
        "Should handle suceess when fetching Pokemon info from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonInfo(name: "test"),
          ).thenAnswer(
            (_) async => Result.success(data: tPokemonInfo),
          );
          // Act
          final result = await getPokemonInfoUseCase(name: "test");
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
        "Should handle failure when fetching Pokemon info from the pokemon repository",
        () async {
          // Arrange
          when(
            () => pokemonRepository.getPokemonInfo(name: "test"),
          ).thenAnswer(
            (_) async => Result.failure(
              message: PokemonRemoteDataSourceImpl.getPokemonInfoFailureMessage,
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
          final result = await getPokemonInfoUseCase(name: "test");
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
