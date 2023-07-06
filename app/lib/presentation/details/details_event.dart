import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:flutter/material.dart';

sealed class DetailsEvent {
  factory DetailsEvent.getPokemonInfo({required PokemonResult pokemon}) =
      GetpokemonInfo;
  factory DetailsEvent.setAverageColor({required ImageProvider imageProvider}) =
      SetAverageColor;
}

class GetpokemonInfo implements DetailsEvent {
  final PokemonResult pokemon;
  GetpokemonInfo({required this.pokemon});
}

class SetAverageColor implements DetailsEvent {
  final ImageProvider imageProvider;
  SetAverageColor({required this.imageProvider});
}
