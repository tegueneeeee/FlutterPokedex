sealed class Result<T> {
  factory Result.success({required T data}) = Success<T>;
  factory Result.failure({
    required String message,
    Exception? exception,
  }) = Failure<T>;
  factory Result.loading() = Loading<T>;
}

class Success<T> implements Result<T> {
  final T data;
  Success({
    required this.data,
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

class Loading<T> implements Result<T> {}
