import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/repository/pokemon_repository.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteData;

  PokemonRepositoryImpl(this.remoteData);

  @override
  Future<Result<PokemonList>> getPokemonList() {
    final result = remoteData.getPokemonList();
    return result;
  }

  @override
  Future<Result<PokemonInfo>> getPokemonInfo({
    required String name,
  }) async {
    final result = remoteData.getPokemonInfo(name: name);
    return result;
  }
}
