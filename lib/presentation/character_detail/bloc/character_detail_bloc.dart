import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_fteam/core/base_state.dart';
import 'package:teste_tecnico_fteam/core/result.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/data/repositories/character_repository.dart';
import 'package:teste_tecnico_fteam/presentation/character_detail/bloc/character_detail_event.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, BaseState<Character>> {
  CharacterDetailBloc(this._repository) : super(const BaseState.initial()) {
    on<LoadById>(_onLoadById);
  }

  final CharacterRepository _repository;
  final Map<int, Character> _cache = {};

  Future<void> _onLoadById(
    LoadById event,
    Emitter<BaseState<Character>> emit,
  ) async {
    if (_cache.containsKey(event.id)) {
      emit(BaseState.success(_cache[event.id]!));
      return;
    }

    emit(const BaseState.loading());

    final result = await _repository.getCharacterById(event.id);

    switch (result) {
      case Success(data: final character):
        _cache[event.id] = character;
        emit(BaseState.success(character));
      case Error(failure: final failure):
        emit(BaseState.error(failure.message));
    }
  }
}
