// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonList _$$_PokemonListFromJson(Map<String, dynamic> json) =>
    _$_PokemonList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokemonListToJson(_$_PokemonList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
