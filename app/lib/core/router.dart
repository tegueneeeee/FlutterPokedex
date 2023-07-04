import 'package:app/domain/entity/pokemon/pokemon_result.dart';
import 'package:app/presentation/details/details_page.dart';
import 'package:app/presentation/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider((ref) => _goRouter);

final GoRouter _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.pageName,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: "details",
          name: DetailsPage.pageName,
          builder: (context, state) => DetailsPage(
            pokemon: state.extra as PokemonResult,
          ),
        )
      ],
    ),
  ],
);
