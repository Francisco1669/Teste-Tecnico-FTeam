import 'package:teste_tecnico_fteam/core/paginated.dart';
import 'package:teste_tecnico_fteam/core/result.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';

abstract class CharacterRepository {
  Future<Result<Paginated<Character>>> getCharacters({int page = 1});
  Future<Result<Character>> getCharacterById(int id);
}
