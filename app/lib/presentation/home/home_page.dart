import 'package:app/core/result.dart';
import 'package:app/di/riverpod_setup.dart';
import 'package:app/presentation/home/home_event.dart';
import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viemodel = ref.watch(homeViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          "FlutterPokédex",
          textStyle: TextStyleEnum.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () => viemodel.onEvent(GetPokemonList()),
            icon: const Icon(Icons.update),
          ),
        ],
      ),
      body: Container(
        child: switch (state.pokemonList) {
          Success(data: final data) => CustomGrid(
              title: "PokeDex",
              listItems: data.results.map(
                (pokemon) {
                  return CustomListTile(
                    title: pokemon.name,
                    leading: CustomImage(
                      imageUrl: pokemon.getImageUrl(),
                    ),
                  );
                },
              ).toList(),
            ),
          Failure(message: final message) => Text(message),
          Loading() => const Text("Loading"),
        },
      ),
    );
  }
}
