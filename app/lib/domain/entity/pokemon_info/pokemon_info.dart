import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_info.freezed.dart';
part 'pokemon_info.g.dart';

@freezed
class PokemonInfo with _$PokemonInfo {
  factory PokemonInfo({
    required int id,
    required String name,
    required int height,
    required int weight,
  }) = _PokemonInfo;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoFromJson(json);
}
