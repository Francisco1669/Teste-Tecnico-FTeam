import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/data/models/info.dart';

part 'character_page_response.freezed.dart';
part 'character_page_response.g.dart';

@freezed
class CharacterPageResponse with _$CharacterPageResponse {
  const factory CharacterPageResponse({
    required Info info,
    required List<Character> results,
  }) = _CharacterPageResponse;

  factory CharacterPageResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterPageResponseFromJson(json);
}
