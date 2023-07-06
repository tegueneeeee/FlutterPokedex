// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonSpecies _$$_PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    _$_PokemonSpecies(
      flavorTexts: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => PokemonFlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokemonSpeciesToJson(_$_PokemonSpecies instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.flavorTexts,
    };
