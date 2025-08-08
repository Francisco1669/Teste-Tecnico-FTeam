import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:teste_tecnico_fteam/core/paginated.dart';
import 'package:teste_tecnico_fteam/data/models/character.dart';
import 'package:teste_tecnico_fteam/presentation/character_list/viewmodel/character_list_viewmodel.dart';
import 'package:teste_tecnico_fteam/presentation/character_list/widgets/character_item.dart';
import 'package:teste_tecnico_fteam/presentation/shared/widgets/empty_view.dart';
import 'package:teste_tecnico_fteam/presentation/shared/widgets/error_view.dart';
import 'package:teste_tecnico_fteam/presentation/shared/widgets/loading_indicator.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<CharacterListViewModel>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
      ),
      body: Consumer<CharacterListViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.state.when(
            initial: () => const LoadingIndicator(),
            loading: () => const LoadingIndicator(),
            success: (data) => _CharacterListContent(
              data: data,
              scrollController: _scrollController,
              onRefresh: viewModel.refresh,
              onRetryAppend: viewModel.loadNextPage,
            ),
            empty: () => EmptyView(
              onRetry: viewModel.retry,
            ),
            error: (message) => ErrorView(
              message: message,
              onRetry: viewModel.retry,
            ),
            refreshing: (data) => _CharacterListContent(
              data: data,
              scrollController: _scrollController,
              onRefresh: viewModel.refresh,
              onRetryAppend: viewModel.loadNextPage,
              isRefreshing: true,
            ),
            appending: (data) => _CharacterListContent(
              data: data,
              scrollController: _scrollController,
              onRefresh: viewModel.refresh,
              onRetryAppend: viewModel.loadNextPage,
            ),
            appendError: (data, error) => _CharacterListContent(
              data: data,
              scrollController: _scrollController,
              onRefresh: viewModel.refresh,
              onRetryAppend: viewModel.loadNextPage,
              appendError: error,
            ),
          );
        },
      ),
    );
  }
}

class _CharacterListContent extends StatelessWidget {
  const _CharacterListContent({
    required this.data,
    required this.scrollController,
    required this.onRefresh,
    required this.onRetryAppend,
    this.isRefreshing = false,
    this.appendError,
  });

  final Paginated<Character> data;
  final ScrollController scrollController;
  final VoidCallback onRefresh;
  final VoidCallback onRetryAppend;
  final bool isRefreshing;
  final String? appendError;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: Column(
        children: [
          if (isRefreshing)
            const LinearProgressIndicator(),
          Expanded(
            child: isTablet 
              ? _CharacterGrid(
                  data: data, 
                  scrollController: scrollController,
                )
              : _CharacterList(
                  data: data, 
                  scrollController: scrollController,
                ),
          ),
          if (data.isLoadingMore)
            const Padding(
              padding: EdgeInsets.all(16),
              child: LoadingIndicator(),
            ),
          if (appendError != null)
            _AppendErrorBanner(
              error: appendError!,
              onRetry: onRetryAppend,
            ),
        ],
      ),
    );
  }
}

class _CharacterList extends StatelessWidget {
  const _CharacterList({
    required this.data,
    required this.scrollController,
  });

  final Paginated<Character> data;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CharacterItem(character: data.items[index]),
        );
      },
    );
  }
}

class _CharacterGrid extends StatelessWidget {
  const _CharacterGrid({
    required this.data,
    required this.scrollController,
  });

  final Paginated<Character> data;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3.5,
      ),
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        return CharacterItem(character: data.items[index]);
      },
    );
  }
}

class _AppendErrorBanner extends StatelessWidget {
  const _AppendErrorBanner({
    required this.error,
    required this.onRetry,
  });

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.errorContainer,
      child: Row(
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              error,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}