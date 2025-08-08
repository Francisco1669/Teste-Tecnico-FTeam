import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated.freezed.dart';

@freezed
class Paginated<T> with _$Paginated<T> {
  const factory Paginated({
    required List<T> items,
    required int currentPage,
    required int totalPages,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _Paginated<T>;

  const Paginated._();

  Paginated<T> copyWithNewItems(
    List<T> newItems,
    int newPage, {
    required bool hasMore,
  }) {
    return copyWith(
      items: [...items, ...newItems],
      currentPage: newPage,
      hasMore: hasMore,
      isLoadingMore: false,
    );
  }

  Paginated<T> copyWithLoadingMore() {
    return copyWith(isLoadingMore: true);
  }

  static Paginated<T> empty<T>() {
    return const Paginated(
      items: [],
      currentPage: 0,
      totalPages: 0,
      hasMore: false,
    );
  }
}
