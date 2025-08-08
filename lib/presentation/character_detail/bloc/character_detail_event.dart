import 'package:equatable/equatable.dart';

abstract class CharacterDetailEvent extends Equatable {
  const CharacterDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadById extends CharacterDetailEvent {
  const LoadById(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
