import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/db/pokemon_result_dao.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_local_datasource.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_local_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture.dart';

class MockPokemonResultDAO extends Mock implements PokemonResultDAO {}

void main() {
  late MockPokemonResultDAO pokemonResultDAO;
  late PokemonLocalDataSource pokemonLocalDataSource;
  late Fixture fixture;
  late List<PokemonResult> tPokemonResults;

  setUp(
    () async {
      pokemonResultDAO = MockPokemonResultDAO();
      pokemonLocalDataSource = PokemonLocalDataSourceImpl(pokemonResultDAO);
      fixture = Fixture();
      tPokemonResults =
          PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson))
              .results;
    },
  );

  group(
    "getPokemonResultsFromDB",
    () {
      test(
        "If the Pokemon results are not saved, "
        "the expected behavior should be return an empty list.",
        () async {
          // Arrage
          when(() => pokemonResultDAO.getPokemonResults())
              .thenAnswer((_) async => []);
          // Act
          final pokemonResults =
              await pokemonLocalDataSource.getPokemonResultsFromDB();
          // Assert
          verify(() => pokemonResultDAO.getPokemonResults()).called(1);
          verifyNoMoreInteractions(pokemonResultDAO);
          expect(pokemonResults, []);
        },
      );

      test(
        "If the Pokemon results are saved "
        "the expected behavior should be return Pokemone results.",
        () async {
          // Arrage
          when(() => pokemonResultDAO.getPokemonResults())
              .thenAnswer((_) async => tPokemonResults);
          when(() => pokemonResultDAO.addPokemonResults(
              pokemonResults: tPokemonResults)).thenAnswer((_) async {});
          // Act
          await pokemonLocalDataSource.savePokemonResultsToDB(
              pokemonResults: tPokemonResults);
          final pokemonResults =
              await pokemonLocalDataSource.getPokemonResultsFromDB();
          // Assert
          verify(() => pokemonResultDAO.getPokemonResults()).called(1);
          verify(() => pokemonResultDAO.addPokemonResults(
              pokemonResults: tPokemonResults)).called(1);
          verifyNoMoreInteractions(pokemonResultDAO);
          expect(pokemonResults, tPokemonResults);
        },
      );
    },
  );
}
