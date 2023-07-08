import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_cache_datasource.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_cache_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture.dart';

void main() {
  late PokemonCacheDataSource pokemonCacheDataSource;
  late Fixture fixture;
  late List<PokemonResult> tPokemonResults;

  setUp(
    () async {
      pokemonCacheDataSource = PokemonCacheDataSourceImpl();
      fixture = Fixture();
      tPokemonResults =
          PokemonList.fromJson(fixture.readJsonFile(Fixture.pokemonListJson))
              .results;
    },
  );

  group(
    "Pokemon results",
    () {
      test(
        "If the Pokemon results are not set, "
        "the expected behavior should be return an empty list.",
        () async {
          final pokemonResults =
              await pokemonCacheDataSource.getPokemonResultsFromCache();
          expect(pokemonResults, []);
        },
      );

      test(
        "If the Pokemon results are set "
        "the expected behavior should be return Pokemone results.",
        () async {
          pokemonCacheDataSource.setPokemonResultsToCache(
              pokemonResults: tPokemonResults);
          final pokemonResults =
              await pokemonCacheDataSource.getPokemonResultsFromCache();
          expect(pokemonResults, tPokemonResults);
        },
      );

      test(
        "If the Pokemon results are set multiple times, "
        "the expected behavior should be return last set of Pokemone results.",
        () async {
          pokemonCacheDataSource.setPokemonResultsToCache(
              pokemonResults: tPokemonResults);
          final tPokemonResults2 = [
            PokemonResult(
              name: "test1",
              url: "test1",
            ),
            PokemonResult(
              name: "test2",
              url: "test2",
            ),
          ];
          pokemonCacheDataSource.setPokemonResultsToCache(
              pokemonResults: tPokemonResults2);
          final pokemonResults =
              await pokemonCacheDataSource.getPokemonResultsFromCache();
          expect(pokemonResults, tPokemonResults2);
        },
      );
    },
  );
}
