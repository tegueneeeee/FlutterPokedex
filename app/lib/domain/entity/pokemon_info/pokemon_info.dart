import 'package:app/domain/entity/pokemon_info/pokemon_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_info.freezed.dart';
part 'pokemon_info.g.dart';

@freezed
class PokemonInfo with _$PokemonInfo {
  PokemonInfo._();
  factory PokemonInfo({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonTypes> types,
  }) = _PokemonInfo;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoFromJson(json);
}
