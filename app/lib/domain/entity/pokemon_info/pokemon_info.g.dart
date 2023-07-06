// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonInfo _$$_PokemonInfoFromJson(Map<String, dynamic> json) =>
    _$_PokemonInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokemonInfoToJson(_$_PokemonInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
    };
