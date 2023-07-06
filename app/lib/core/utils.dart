import 'package:flutter/material.dart';

class PokemonTypeUtils {
  static Color getTypeColor(String type) {
    return switch (type) {
      "grass" => Colors.lightGreen,
      "poison" => Colors.purple,
      "fire" => Colors.orange,
      "flying" => Colors.lightBlueAccent,
      "water" => Colors.blueGrey,
      "bug" => Colors.green,
      "electric" => Colors.amber,
      "ground" => Colors.brown,
      "fairy" => Colors.pinkAccent,
      "fighting" => Colors.deepOrange,
      "psychic" => Colors.pink,
      "rock" => Colors.amberAccent,
      _ => Colors.grey,
    };
  }
}
