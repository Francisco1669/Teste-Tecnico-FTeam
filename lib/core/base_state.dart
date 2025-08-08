import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teste_tecnico_fteam/core/result.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial<T>;
  const factory BaseState.loading() = _Loading<T>;
  const factory BaseState.success(T data) = _Success<T>;
  const factory BaseState.empty() = _Empty<T>;
  const factory BaseState.error(String message) = _Error<T>;
  const factory BaseState.refreshing(T data) = _Refreshing<T>;
  const factory BaseState.appending(T data) = _Appending<T>;
  const factory BaseState.appendError(T data, String error) = _AppendError<T>;
}

extension BaseStateX<T> on BaseState<T> {
  bool get isLoading => when(
        initial: () => false,
        loading: () => true,
        success: (_) => false,
        empty: () => false,
        error: (_) => false,
        refreshing: (_) => false,
        appending: (_) => false,
        appendError: (_, __) => false,
      );

  bool get isSuccess => when(
        initial: () => false,
        loading: () => false,
        success: (_) => true,
        empty: () => false,
        error: (_) => false,
        refreshing: (_) => false,
        appending: (_) => false,
        appendError: (_, __) => false,
      );

  bool get hasData => when(
        initial: () => false,
        loading: () => false,
        success: (_) => true,
        empty: () => false,
        error: (_) => false,
        refreshing: (_) => true,
        appending: (_) => true,
        appendError: (_, __) => true,
      );

  T? get maybeData => when(
        initial: () => null,
        loading: () => null,
        success: (data) => data,
        empty: () => null,
        error: (_) => null,
        refreshing: (data) => data,
        appending: (data) => data,
        appendError: (data, _) => data,
      );

  String? get messageOrNull => when(
        initial: () => null,
        loading: () => null,
        success: (_) => null,
        empty: () => null,
        error: (message) => message,
        refreshing: (_) => null,
        appending: (_) => null,
        appendError: (_, error) => error,
      );

  static BaseState<T> fromResult<T>(Result<T> result) {
    return result.fold(
      (failure) => BaseState.error(failure.message),
      BaseState.success,
    );
  }
}
