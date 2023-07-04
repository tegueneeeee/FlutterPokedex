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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const CustomText(
          "FlutterPokédex",
          textStyle: TextStyleEnum.headlineMedium,
        ),
      ),
      body: Container(
        color: Colors.grey[800],
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * 0.3,
              child: Hero(
                tag: pokemon.name,
                child: CustomCard(
                  width: size.width * 0.30,
                  height: size.height * 0.15,
                  imageProvider: NetworkImage(pokemon.getImageUrl()),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
