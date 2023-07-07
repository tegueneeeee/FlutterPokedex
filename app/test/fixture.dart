import 'dart:convert';
import 'dart:io';

class Fixture {
  Map<String, dynamic> call(String name) {
    final dir = Directory.current.path;
    return jsonDecode(File("$dir/test/fixture/$name").readAsStringSync());
  }

  static const pokemonListJson = "pokemon_list.json";
  static const pokemonInfoJson = "pokemon_info.json";
}
