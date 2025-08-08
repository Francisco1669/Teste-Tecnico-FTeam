import 'package:teste_tecnico_fteam/core/errors/failure.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

class Error<T> extends Result<T> {
  const Error(this.failure);
  final Failure failure;
}

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  T? get data => switch (this) {
    final Success<T> success => success.data,
    Error<T> _ => null,
  };

  Failure? get failure => switch (this) {
    Success<T> _ => null,
    final Error<T> error => error.failure,
  };

  R fold<R>(
    R Function(Failure failure) onError,
    R Function(T data) onSuccess,
  ) {
    return switch (this) {
      final Success<T> success => onSuccess(success.data),
      final Error<T> error => onError(error.failure),
    };
  }
}
