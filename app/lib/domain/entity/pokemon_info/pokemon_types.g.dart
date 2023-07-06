// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonTypes _$$_PokemonTypesFromJson(Map<String, dynamic> json) =>
    _$_PokemonTypes(
      slot: json['slot'] as int,
      type: PokemonType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PokemonTypesToJson(_$_PokemonTypes instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
