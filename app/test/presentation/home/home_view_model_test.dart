// import 'package:app/core/result.dart';
// import 'package:app/di/riverpod_setup.dart';
// import 'package:app/domain/entity/pokemon/pokemon_list.dart';
// import 'package:app/domain/usecase/pokemon/get_pokemon_list_usecase.dart';
// import 'package:app/presentation/home/home_event.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../fixture.dart';

// class MockGetPokemonListUseCase extends Mock implements GetPokemonListUseCase {}

// void main() {
//   late MockGetPokemonListUseCase getPokemonListUseCase;
//   late ProviderContainer providerContainer;
//   late Fixture fixture;
//   late PokemonList tPokemonList;

//   setUp(
//     () async {
//       getPokemonListUseCase = MockGetPokemonListUseCase();
//       providerContainer = ProviderContainer(
//         overrides: [
//           getPokemonListUseCaseProvider
//               .overrideWithValue(getPokemonListUseCase),
//         ],
//       );
//       fixture = Fixture();
//       tPokemonList =
//           PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson));
//     },
//   );

//   group(
//     "getPokemonList",
//     () {
//       test(
//         "Should fetch pokemon list from the getPokemonListUseCase",
//         () async {
//           // Arrange
//           when(() => getPokemonListUseCase()).thenAnswer(
//             (_) async => Result.success(data: tPokemonList.results),
//           );
//           // Act
//           providerContainer.read(homeViewModelProvider.notifier);
//           // Assert
//           verify(() => getPokemonListUseCase()).called(1);
//           verifyNoMoreInteractions(getPokemonListUseCase);
//         },
//       );

//       test(
//         "Should handle suceess when fetching Pokemon list from the getPokemonListUseCase",
//         () async {
//           // Arrange
//           when(() => getPokemonListUseCase()).thenAnswer(
//             (_) async => Result.success(data: tPokemonList.results),
//           );
//           // Act
//           final homeViewModel =
//               providerContainer.read(homeViewModelProvider.notifier);
//           await homeViewModel.onEvent(HomeEvent.getPokemonList());
//           final state = providerContainer.read(homeViewModelProvider);
//           final result = state.pokemonResults;
//           final data = (state.pokemonResults as Success<PokemonList>).data;
//           // Assert
//           expect(result, isA<Success<PokemonList>>());
//           expect(data, tPokemonList);
//         },
//       );

//       test(
//         "Should handle failure when fetching Pokemon list from the getPokemonListUseCase",
//         () async {
//           // Arrange
//           when(() => getPokemonListUseCase()).thenAnswer(
//             (_) async => Result.failure(
//               message: "test",
//               exception: DioException.badResponse(
//                 statusCode: 404,
//                 requestOptions: RequestOptions(),
//                 response: Response(
//                   requestOptions: RequestOptions(),
//                 ),
//               ),
//             ),
//           );
//           // Act
//           final homeViewModel =
//               providerContainer.read(homeViewModelProvider.notifier);
//           await homeViewModel.onEvent(HomeEvent.getPokemonList());
//           final state = providerContainer.read(homeViewModelProvider);
//           final result = state.pokemonResults;
//           final message =
//               (state.pokemonResults as Failure<PokemonList>).message;
//           // Assert
//           expect(result, isA<Failure<PokemonList>>());
//           expect(message, "test");
//         },
//       );
//     },
//   );
// }
