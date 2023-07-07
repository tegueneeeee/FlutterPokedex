import 'package:app/core/result.dart';
import 'package:app/core/router.dart';
import 'package:app/di/riverpod_setup.dart';
import 'package:app/presentation/details/details_event.dart';
import 'package:app/presentation/details/details_page.dart';
import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const pageName = "homePage";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const CustomText(
            "FlutterPokédex",
            textStyle: TextStyleEnum.headlineMedium,
          ),
        ),
        body: switch (state.pokemonList) {
          Success(data: final data) => CustomGrid(
              listItems: data.results.map(
                (pokemon) {
                  final pokemonImage = NetworkImage(pokemon.getImageUrl());
                  return Column(
                    children: [
                      CustomCard(
                        id: pokemon.getId(),
                        title: pokemon.name,
                        image: pokemonImage,
                        onTap: () async {
                          ref.read(detailsViewModelProvider.notifier).onEvent(
                                DetailsEvent.setAverageColor(
                                  imageProvider: pokemonImage,
                                ),
                              );
                          ref.read(detailsViewModelProvider.notifier).onEvent(
                                DetailsEvent.getPokemonInfo(pokemon: pokemon),
                              );
                          ref
                              .read(goRouterProvider)
                              .goNamed(DetailsPage.pageName, extra: pokemon);
                        },
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          Failure(message: final message) => Text(message),
          Loading() => const CustomProgressbar(),
        },
      ),
    );
  }
}
