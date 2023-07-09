import 'package:app/app.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter('pokemonHive');
  Hive.registerAdapter(PokemonResultAdapter());
  await Hive.openBox<PokemonResult>('pokemonResult');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
