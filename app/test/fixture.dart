import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class Fixture {
  final dir = Directory.current.path;
  Map<String, dynamic> readJsonFile(String name) {
    return jsonDecode(File("$dir/test/fixture/$name").readAsStringSync());
  }

  ImageProvider readImageFies(String name) {
    return FileImage(File("$dir/test/fixture/$name"));
  }

  static const pokemonListJson = "pokemon_list.json";
  static const pokemonInfoJson = "pokemon_info.json";
  static const pokemonSpeciesJson = "pokemon_species.json";
  static const pokemonImage = "pokemon_image.png";
}
