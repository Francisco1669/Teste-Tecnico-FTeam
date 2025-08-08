import 'package:flutter/foundation.dart';
import 'package:teste_tecnico_fteam/core/base_state.dart';
import 'package:teste_tecnico_fteam/core/result.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/data/repositories/character_repository.dart';

class CharacterDetailViewModel extends ChangeNotifier {
  CharacterDetailViewModel(this._repository);

  final CharacterRepository _repository;
  final Map<int, Character> _cache = {};
  
  BaseState<Character> _state = const BaseState.initial();
  BaseState<Character> get state => _state;

  void _emit(BaseState<Character> newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> loadCharacterById(int id) async {
    if (_cache.containsKey(id)) {
      _emit(BaseState.success(_cache[id]!));
      return;
    }

    _emit(const BaseState.loading());
    
    final result = await _repository.getCharacterById(id);
    
    switch (result) {
      case Success(data: final character):
        _cache[id] = character;
        _emit(BaseState.success(character));
      case Error(failure: final failure):
        _emit(BaseState.error(failure.message));
    }
  }

  void retry(int id) {
    loadCharacterById(id);
  }
}