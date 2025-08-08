import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_fteam/core/http/dio_client.dart';
import 'package:teste_tecnico_fteam/data/datasources/remote/rick_api_client.dart';
import 'package:teste_tecnico_fteam/data/repositories/character_repository.dart';
import 'package:teste_tecnico_fteam/data/repositories/character_repository_impl.dart';
import 'package:teste_tecnico_fteam/presentation/character_detail/viewmodel/character_detail_viewmodel.dart';
import 'package:teste_tecnico_fteam/presentation/character_list/viewmodel/character_list_viewmodel.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  getIt..registerSingleton<Dio>(createDio())
  
  ..registerSingleton<RickApiClient>(
    RickApiClient(getIt<Dio>()),
  )
  
  ..registerSingleton<CharacterRepository>(
    CharacterRepositoryImpl(getIt<RickApiClient>()),
  )
  
  ..registerFactory<CharacterListViewModel>(
    () => CharacterListViewModel(getIt<CharacterRepository>()),
  )
  
  ..registerFactory<CharacterDetailViewModel>(
    () => CharacterDetailViewModel(getIt<CharacterRepository>()),
  );
}
