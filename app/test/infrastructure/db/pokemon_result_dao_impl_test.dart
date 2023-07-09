import 'dart:io';

import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/db/pokemon_result_dao.dart';
import 'package:app/infrastructure/db/pokemon_result_dao_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../fixture.dart';

void main() async {
  late Box<PokemonResult> pokemonResultBox;
  late PokemonResultDAO pokemonResultDAO;
  late Fixture fixture;
  late List<PokemonResult> tPokemonResults;
  Hive.init("${Directory.current.path}/test/fixture");
  Hive.registerAdapter(PokemonResultAdapter());

  setUp(
    () async {
      await Hive.openBox<PokemonResult>("pokemonResult");
      pokemonResultBox = Hive.box<PokemonResult>("pokemonResult");
      pokemonResultDAO = PokemonResultDAOImpl(pokemonResultBox);
      fixture = Fixture();
      tPokemonResults =
          PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson))
              .results;
    },
  );
  tearDown(
    () async {
      await pokemonResultBox.close();
      await Hive.deleteBoxFromDisk("pokemonResult");
    },
  );

  group(
    "Pokemon results",
    () {
      test(
        "If the Pokemon results are not added, "
        "the expected behavior should be return an empty list.",
        () async {
          final pokemonResults = await pokemonResultDAO.getPokemonResults();
          expect(pokemonResults, []);
        },
      );

      test(
        "If the Pokemon results are added "
        "the expected behavior should be return Pokemone results.",
        () async {
          pokemonResultDAO.addPokemonResults(pokemonResults: tPokemonResults);
          final pokemonResults = await pokemonResultDAO.getPokemonResults();
          expect(pokemonResults, tPokemonResults);
        },
      );

      test(
        "If the Pokemon results are added after clearing "
        "the expected behavior should be return an empty list.",
        () async {
          pokemonResultDAO.addPokemonResults(pokemonResults: tPokemonResults);
          await pokemonResultDAO.clear();
          final pokemonResults = await pokemonResultDAO.getPokemonResults();
          expect(pokemonResults, []);
        },
      );
    },
  );
}
