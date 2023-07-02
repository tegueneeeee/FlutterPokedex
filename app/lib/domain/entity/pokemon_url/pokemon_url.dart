import 'package:app/domain/entity/pokemon_url/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_url.freezed.dart';
part 'pokemon_url.g.dart';

@freezed
class PokemonUrl with _$PokemonUrl {
  factory PokemonUrl({
    required List<Result> results,
  }) = _PokemonUrl;

  factory PokemonUrl.fromJson(Map<String, dynamic> json) =>
      _$PokemonUrlFromJson(json);
}
