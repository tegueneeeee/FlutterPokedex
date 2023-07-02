sealed class Result<T> {
  const Result._();
}

class Success<T> implements Result<T> {
  final T data;
  Success({
    required this.data,
  });
}

class Loading<T> implements Result<T> {
  final T? data;

  Loading({
    this.data,
  });
}

class Failure<T> implements Result<T> {
  final String message;
  final Exception? exception;

  Failure({
    required this.message,
    this.exception,
  });
}
