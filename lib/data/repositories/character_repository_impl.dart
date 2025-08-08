import 'package:dio/dio.dart';
import 'package:teste_tecnico_fteam/core/errors/failure.dart';
import 'package:teste_tecnico_fteam/core/paginated.dart';
import 'package:teste_tecnico_fteam/core/result.dart';
import 'package:teste_tecnico_fteam/data/datasources/remote/rick_api_client.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/data/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  const CharacterRepositoryImpl(this._apiClient);

  final RickApiClient _apiClient;

  @override
  Future<Result<Paginated<Character>>> getCharacters({int page = 1}) async {
    try {
      final response = await _apiClient.getCharacters(page: page);
      
      final paginated = Paginated<Character>(
        items: response.results,
        currentPage: page,
        totalPages: response.info.pages,
        hasMore: response.info.next != null,
      );
      
      return Success(paginated);
    } on DioException catch (e) {
      return Error(_mapDioException(e));
    } catch (e) {
      return const Error(ParseFailure(message: 'Failed to parse response'));
    }
  }

  @override
  Future<Result<Character>> getCharacterById(int id) async {
    try {
      final character = await _apiClient.getCharacterById(id);
      return Success(character);
    } on DioException catch (e) {
      return Error(_mapDioException(e));
    } catch (e) {
      return const Error(ParseFailure(message: 'Failed to parse character'));
    }
  }

  Failure _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'Connection error');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 404) {
          return const ServerFailure(message: 'Character not found');
        }
        return ServerFailure(message: 'Server error: $statusCode');
      case DioExceptionType.unknown:
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        return const NetworkFailure(message: 'Network error');
    }
  }
}
