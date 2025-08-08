import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teste_tecnico_fteam/app/router.dart';
import 'package:teste_tecnico_fteam/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final GoRouter _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick & Morty Characters',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: _router,
    );
  }
}
