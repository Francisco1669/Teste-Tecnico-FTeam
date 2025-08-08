import 'package:flutter/foundation.dart';
import 'package:teste_tecnico_fteam/core/base_state.dart';
import 'package:teste_tecnico_fteam/core/paginated.dart';
import 'package:teste_tecnico_fteam/core/result.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/data/repositories/character_repository.dart';

class CharacterListViewModel extends ChangeNotifier {
  CharacterListViewModel(this._repository);

  final CharacterRepository _repository;
  
  BaseState<Paginated<Character>> _state = const BaseState.initial();
  BaseState<Paginated<Character>> get state => _state;

  void _emit(BaseState<Paginated<Character>> newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> loadFirstPage() async {
    _emit(const BaseState.loading());
    
    final result = await _repository.getCharacters();
    
    switch (result) {
      case Success(data: final paginated):
        if (paginated.items.isEmpty) {
          _emit(const BaseState.empty());
        } else {
          _emit(BaseState.success(paginated));
        }
      case Error(failure: final failure):
        _emit(BaseState.error(failure.message));
    }
  }

  Future<void> loadNextPage() async {
    if (!_state.hasData) return;
    
    final currentData = _state.maybeData!;
    if (!currentData.hasMore || currentData.isLoadingMore) return;

    _emit(BaseState.appending(currentData.copyWithLoadingMore()));

    final result = await _repository.getCharacters(
        page: currentData.currentPage + 1);
    
    switch (result) {
      case Success(data: final newPage):
        final updatedData = currentData.copyWithNewItems(
          newPage.items,
          newPage.currentPage,
          hasMore: newPage.hasMore,
        );
        _emit(BaseState.success(updatedData));
      case Error(failure: final failure):
        _emit(BaseState.appendError(currentData, failure.message));
    }
  }

  Future<void> refresh() async {
    if (_state.hasData) {
      _emit(BaseState.refreshing(_state.maybeData!));
    }

    final result = await _repository.getCharacters();
    
    switch (result) {
      case Success(data: final paginated):
        if (paginated.items.isEmpty) {
          _emit(const BaseState.empty());
        } else {
          _emit(BaseState.success(paginated));
        }
      case Error(failure: final failure):
        _emit(BaseState.error(failure.message));
    }
  }

  void retry() {
    loadFirstPage();
  }
}