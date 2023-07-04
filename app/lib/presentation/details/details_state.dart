import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState {
  factory DetailsState({
    required Result<PokemonInfo> pokemonInfo,
  }) = _DetailsState;
}
