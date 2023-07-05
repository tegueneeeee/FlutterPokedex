import 'dart:convert';
import 'dart:io';

class Fixture {
  Map<String, dynamic> call(String name) {
    final dir = Directory.current.path;
    return jsonDecode(File("$dir/test/fixture/$name").readAsStringSync());
  }

  static const pokemonJson = "pokemon_list.json";
}
