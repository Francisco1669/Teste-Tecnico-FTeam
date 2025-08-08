import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:teste_tecnico_fteam/app/di.dart';
import 'package:teste_tecnico_fteam/presentation/character_list/view/character_list_view.dart';
import 'package:teste_tecnico_fteam/presentation/character_list/viewmodel/character_list_viewmodel.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<CharacterListViewModel>()
        ..loadFirstPage(),
      child: const CharacterListView(),
    );
  }
}