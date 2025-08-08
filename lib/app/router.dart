import 'package:go_router/go_router.dart';
import 'package:teste_tecnico_fteam/presentation/character_detail/view/character_detail_page.dart';
import 'package:teste_tecnico_fteam/presentation/character_list/view/character_list_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/characters',
    routes: [
      GoRoute(
        path: '/characters',
        builder: (context, state) => const CharacterListPage(),
      ),
      GoRoute(
        path: '/characters/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return CharacterDetailPage(characterId: id);
        },
      ),
    ],
  );
}
