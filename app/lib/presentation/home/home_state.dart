import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required Result<List<PokemonResult>> pokemonResults,
  }) = _HomeState;
}
