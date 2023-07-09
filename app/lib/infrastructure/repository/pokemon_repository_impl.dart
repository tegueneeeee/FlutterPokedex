import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';
import 'package:app/domain/repository/pokemon_repository.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_cache_datasource.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_local_datasource.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonCacheDataSource cacheDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl(
    this.remoteDataSource,
    this.cacheDataSource,
    this.localDataSource,
  );

  @override
  Future<Result<List<PokemonResult>>> getPokemonResults() async {
    try {
      final pokemonResults = await _getPokemonResultsFromCache();
      return Result.success(data: pokemonResults);
    } on Exception catch (e) {
      return Result.failure(message: e.toString(), exception: e);
    }
  }

  Future<List<PokemonResult>> _getPokemonResultsFromCache() async {
    late List<PokemonResult> pokemonResults;
    pokemonResults = await cacheDataSource.getPokemonResultsFromCache();
    if (pokemonResults.isEmpty) {
      pokemonResults = await _getPokemonResultsFromDB();
      cacheDataSource.setPokemonResultsToCache(pokemonResults: pokemonResults);
    }
    return pokemonResults;
  }

  Future<List<PokemonResult>> _getPokemonResultsFromDB() async {
    late List<PokemonResult> pokemonResults;
    pokemonResults = await localDataSource.getPokemonResultsFromDB();
    if (pokemonResults.isEmpty) {
      pokemonResults = await _getPokemonResultsFromApi();
      localDataSource.savePokemonResultsToDB(pokemonResults: pokemonResults);
    }
    return pokemonResults;
  }

  Future<List<PokemonResult>> _getPokemonResultsFromApi() async {
    late List<PokemonResult> pokemonResults;
    final response = await remoteDataSource.getPokemonList();
    pokemonResults = response.results;
    return pokemonResults;
  }

  @override
  Future<Result<PokemonInfo>> getPokemonInfo({
    required String name,
  }) async {
    final result = remoteDataSource.getPokemonInfo(name: name);
    return result;
  }

  @override
  Future<Result<PokemonSpecies>> getPokemonSpecies({
    required String name,
  }) {
    final result = remoteDataSource.getPokemonSpecies(name: name);
    return result;
  }
}
