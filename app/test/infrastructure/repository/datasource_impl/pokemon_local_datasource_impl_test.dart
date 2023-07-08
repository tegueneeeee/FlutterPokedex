import 'package:app/infrastructure/db/pokemon_result_dao.dart';
import 'package:app/infrastructure/repository/datasource/pokemon_local_datasource.dart';
import 'package:app/infrastructure/repository/datasource_impl/pokemon_local_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonResultDAO extends Mock implements PokemonResultDAO {}

void main() {
  late MockPokemonResultDAO pokemonResultDAO;
  late PokemonLocalDataSource pokemonLocalDataSource;

  setUp(
    () async {
      pokemonResultDAO = MockPokemonResultDAO();
      pokemonLocalDataSource = PokemonLocalDataSourceImpl(pokemonResultDAO);
    },
  );
}
