import 'package:app/core/extensions.dart';
import 'package:app/core/result.dart';
import 'package:app/core/utils.dart';
import 'package:app/di/riverpod_setup.dart';
import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({
    required this.pokemon,
    super.key,
  });
  static const pageName = "detailsPage";

  final PokemonResult pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const CustomText(
          "FlutterPokédex",
          textStyle: TextStyleEnum.headlineMedium,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                Container(
                  color: state.averageColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomText(
                          pokemon.name,
                          textStyle: TextStyleEnum.headlineMedium,
                          color: state.averageColor.contrastingColor(),
                        ),
                      ),
                      Hero(
                        tag: pokemon.name,
                        child: CustomImage(
                          image: NetworkImage(pokemon.getImageUrl()),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: switch (state.pokemonInfo) {
                    Success(data: final pokemonInfo) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const CustomText(
                                      "Height",
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      "${pokemonInfo.height * 10} cm",
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const CustomText(
                                      "Weight",
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      "${pokemonInfo.weight / 10} kg",
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 8.0),
                            child: CustomText(
                              "Type",
                              textStyle: TextStyleEnum.bodyLarge,
                            ),
                          ),
                          Row(
                            children: pokemonInfo.types
                                .map(
                                  (types) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: PokemonTypeUtils.getTypeColor(
                                            types.type.name),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      width: 150,
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          types.type.name
                                              .capitalizeFirstLetter(),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    Failure(message: final message) => Text(message),
                    Loading() => const CircularProgressIndicator()
                  },
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Container(
                  color: state.averageColor,
                  child: Hero(
                    tag: pokemon.name,
                    child: CustomImage(
                      image: NetworkImage(pokemon.getImageUrl()),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
