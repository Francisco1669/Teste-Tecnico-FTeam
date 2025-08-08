import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/presentation/character_detail/viewmodel/character_detail_viewmodel.dart';
import 'package:teste_tecnico_fteam/presentation/shared/widgets/error_view.dart';
import 'package:teste_tecnico_fteam/presentation/shared/widgets/loading_indicator.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({required this.characterId, super.key});

  final int characterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        leading: IconButton(
          onPressed: () => context.go('/characters'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Consumer<CharacterDetailViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.state.when(
            initial: () => const LoadingIndicator(),
            loading: () => const LoadingIndicator(),
            success: (character) => 
              _CharacterDetailContent(character: character),
            empty: () => const SizedBox.shrink(),
            error: (message) => ErrorView(
              message: message,
              onRetry: () => viewModel.retry(characterId),
            ),
            refreshing: (character) => 
              _CharacterDetailContent(character: character),
            appending: (character) => 
              _CharacterDetailContent(character: character),
            appendError: (character, error) => 
              _CharacterDetailContent(character: character),
          );
        },
      ),
    );
  }
}

class _CharacterDetailContent extends StatelessWidget {
  const _CharacterDetailContent({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'character-${character.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 200,
                    height: 200,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest,
                    child: const Icon(Icons.person, size: 64),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 200,
                    height: 200,
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Icon(
                      Icons.error,
                      size: 64,
                      color: Theme.of(context)
                          .colorScheme
                          .onErrorContainer,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            character.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _DetailCard(
            title: 'Informações Básicas',
            children: [
              _DetailRow(label: 'Status', value: character.status),
              _DetailRow(label: 'Espécie', value: character.species),
              _DetailRow(label: 'Gênero', value: character.gender),
            ],
          ),
          const SizedBox(height: 16),
          _DetailCard(
            title: 'Localização',
            children: [
              _DetailRow(label: 'Origem', value: character.origin.name),
              _DetailRow(
                label: 'Localização atual',
                value: character.location.name,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _DetailCard(
            title: 'Episódios',
            children: [
              _DetailRow(
                label: 'Total de episódios',
                value: '${character.episode.length}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}