sealed class HomeEvent<T> {
  const HomeEvent._();
}

class GetPokemonList<T> implements HomeEvent<T> {}

// class Loading<T> implements HomeEvent<T> {
//   final T? data;

//   Loading({
//     this.data,
//   });
// }

// class Failure<T> implements HomeEvent<T> {
//   final String message;
//   final Exception? exception;

//   Failure({
//     required this.message,
//     this.exception,
//   });
// }
