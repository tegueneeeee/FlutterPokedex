sealed class HomeEvent {
  factory HomeEvent.getPokemonList() = GetPokemonList;
}

class GetPokemonList implements HomeEvent {}
