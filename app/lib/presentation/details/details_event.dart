sealed class DetailsEvent {
  factory DetailsEvent.getPokemonInfo() = GetpokemonInfo;
}

class GetpokemonInfo implements DetailsEvent {}
