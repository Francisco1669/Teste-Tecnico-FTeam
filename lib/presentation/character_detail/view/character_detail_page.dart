import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:teste_tecnico_fteam/app/di.dart';
import 'package:teste_tecnico_fteam/presentation/character_detail/view/character_detail_view.dart';
import 'package:teste_tecnico_fteam/presentation/character_detail/viewmodel/character_detail_viewmodel.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({required this.characterId, super.key});

  final int characterId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<CharacterDetailViewModel>()
        ..loadCharacterById(characterId),
      child: CharacterDetailView(characterId: characterId),
    );
  }
}
