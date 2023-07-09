import 'dart:ui';

import 'package:app/core/result.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:app/domain/entity/pokemon_species/pokemon_species.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState {
  factory DetailsState({
    required Result<PokemonInfo> pokemonInfo,
    required Result<PokemonSpecies> pokemonSpecies,
    required Result<Color> averageColor,
  }) = _DetailsState;
}
