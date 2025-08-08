import 'package:dio/dio.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/data/models/responses/character_page_response.dart';

class RickApiClient {
  const RickApiClient(this._dio);

  final Dio _dio;

  Future<CharacterPageResponse> getCharacters({int page = 1}) async {
    final response = await _dio.get<Map<String, dynamic>>('/character', queryParameters: {'page': page});
    return CharacterPageResponse.fromJson(response.data!);
  }

  Future<Character> getCharacterById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>('/character/$id');
    return Character.fromJson(response.data!);
  }
}
