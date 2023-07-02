// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonUrl _$$_PokemonUrlFromJson(Map<String, dynamic> json) =>
    _$_PokemonUrl(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokemonUrlToJson(_$_PokemonUrl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
