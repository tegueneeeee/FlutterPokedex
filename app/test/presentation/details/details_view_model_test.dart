import 'package:app/core/result.dart';
import 'package:app/di/riverpod_setup.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/usecase/image_provider/get_image_provider_average_color_usecase.dart';
import 'package:app/domain/usecase/pokemon/get_pokemon_info_usecase.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_remote_datasource_impl.dart';
import 'package:app/presentation/details/details_event.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixture.dart';

class MockGetPokemonInfoUseCase extends Mock implements GetPokemonInfoUseCase {}

class MockGetImageProviderAverageColorUseCase extends Mock
    implements GetImageProviderAverageColorUseCase {}

void main() {
  late MockGetPokemonInfoUseCase getPokemonInfoUseCase;
  late ProviderContainer providerContainer;
  late Fixture fixture;
  late PokemonInfo tPokemonInfo;
  late MockGetImageProviderAverageColorUseCase
      getImageProviderAverageColorUseCase;
  late ImageProvider tImageProvider;

  setUp(
    () async {
      getPokemonInfoUseCase = MockGetPokemonInfoUseCase();
      fixture = Fixture();
      tPokemonInfo =
          PokemonInfo.fromJson(fixture.readJsonFile(Fixture.pokemonInfoJson));
      getImageProviderAverageColorUseCase =
          MockGetImageProviderAverageColorUseCase();
      tImageProvider = fixture.readImageFies(Fixture.pokemonImage);

      providerContainer = ProviderContainer(
        overrides: [
          getPokemonInfoUseCaseProvider
              .overrideWithValue(getPokemonInfoUseCase),
          getImageProviderAverageColorUseCaseProvider
              .overrideWithValue(getImageProviderAverageColorUseCase)
        ],
      );
    },
  );

  group(
    "getPokemonInfo",
    () {
      test(
        "Should fetch pokemon info from the getPokemonListUseCase",
        () async {
          // Arrange
          when(() => getPokemonInfoUseCase(name: "test")).thenAnswer(
            (_) async => Result.success(data: tPokemonInfo),
          );
          // Act
          final detatilsViewModel =
              providerContainer.read(detailsViewModelProvider.notifier);
          detatilsViewModel.onEvent(
            DetailsEvent.getPokemonInfo(
              pokemon: PokemonResult(name: "test", url: "test"),
            ),
          );
          // Assert
          verify(() => getPokemonInfoUseCase(name: "test")).called(1);
          verifyNoMoreInteractions(getPokemonInfoUseCase);
        },
      );

      test(
        "Should handle suceess when fetching Pokemon info from the getPokemonListUseCase",
        () async {
          // Arrange
          when(() => getPokemonInfoUseCase(name: "test")).thenAnswer(
            (_) async => Result.success(data: tPokemonInfo),
          );
          // Act
          final detailsViewModel =
              providerContainer.read(detailsViewModelProvider.notifier);
          await detailsViewModel.onEvent(
            DetailsEvent.getPokemonInfo(
              pokemon: PokemonResult(name: "test", url: "test"),
            ),
          );
          final state = providerContainer.read(detailsViewModelProvider);
          final result = state.pokemonInfo;
          final data = (state.pokemonInfo as Success<PokemonInfo>).data;
          // Assert
          expect(result, isA<Success<PokemonInfo>>());
          expect(data, tPokemonInfo);
        },
      );

      test(
        "Should handle failure when fetching Pokemon info from the getPokemonListUseCase",
        () async {
          // Arrange
          when(() => getPokemonInfoUseCase(name: "test")).thenAnswer(
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
          final detailsViewModel =
              providerContainer.read(detailsViewModelProvider.notifier);
          await detailsViewModel.onEvent(
            DetailsEvent.getPokemonInfo(
              pokemon: PokemonResult(name: "test", url: "test"),
            ),
          );
          final state = providerContainer.read(detailsViewModelProvider);
          final result = state.pokemonInfo;
          final message = (state.pokemonInfo as Failure<PokemonInfo>).message;
          // Assert
          expect(result, isA<Failure<PokemonInfo>>());
          expect(message,
              PokemonRemoteDataSourceImpl.getPokemonInfoFailureMessage);
        },
      );
    },
  );

  group(
    "setAverageColor",
    () {
      test(
        "Should fetch average color from the getImageProviderAverageColorUseCase",
        () async {
          // Arrage
          when(() => getImageProviderAverageColorUseCase(
                  imageProvider: tImageProvider))
              .thenAnswer((_) async => Result.success(data: Colors.red));
          // Act
          final detailsViewModel =
              providerContainer.read(detailsViewModelProvider.notifier);
          detailsViewModel.onEvent(
              DetailsEvent.setAverageColor(imageProvider: tImageProvider));
          // Assert
          verify(() => getImageProviderAverageColorUseCase(
              imageProvider: tImageProvider)).called(1);
          verifyNoMoreInteractions(getImageProviderAverageColorUseCase);
        },
      );

      test(
        "Should handle suceess when fetching average color from the getImageProviderAverageColorUseCase",
        () async {
          // Arrage
          when(() => getImageProviderAverageColorUseCase(
                  imageProvider: tImageProvider))
              .thenAnswer((_) async => Result.success(data: Colors.red));
          // Act
          final detailsViewModel =
              providerContainer.read(detailsViewModelProvider.notifier);
          await detailsViewModel.onEvent(
              DetailsEvent.setAverageColor(imageProvider: tImageProvider));
          final state = providerContainer.read(detailsViewModelProvider);
          final result = state.averageColor;
          final data = (state.averageColor as Success<Color>).data;
          // Assert
          expect(result, isA<Success<Color>>());
          expect(data, Colors.red);
        },
      );

      test(
        "Should handle failure when fetching average color from the getImageProviderAverageColorUseCase",
        () async {
          // Arrage
          when(() => getImageProviderAverageColorUseCase(
                  imageProvider: tImageProvider))
              .thenAnswer((_) async => Result.failure(message: "test"));
          // Act
          final detailsViewModel =
              providerContainer.read(detailsViewModelProvider.notifier);
          await detailsViewModel.onEvent(
              DetailsEvent.setAverageColor(imageProvider: tImageProvider));
          final state = providerContainer.read(detailsViewModelProvider);
          final result = state.averageColor;
          final failure = (state.averageColor as Failure<Color>);
          // Assert
          expect(result, isA<Failure<Color>>());
          expect(failure.message, "test");
        },
      );
    },
  );
}
