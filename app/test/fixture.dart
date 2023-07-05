import 'dart:convert';
import 'dart:io';

Map<String, dynamic> fixture(String name) {
  final dir = Directory.current.path;
  return jsonDecode(File("$dir/test/fixture/$name").readAsStringSync());
}

const pokemonJson = "pokemon_list.json";
