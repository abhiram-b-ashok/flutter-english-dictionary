import 'package:flutter/material.dart';
import 'package:english_dictionary/data/datasources/local/sembast_database.dart';
import 'package:english_dictionary/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sembastDatabase = SembastDatabase();
  await sembastDatabase.open();

  runApp(
    ProviderScope(
      overrides: [
        sembastStoreProvider.overrideWithValue(sembastDatabase),
      ],
      child: const AngLingoApp(),
    ),
  );
}

class AngLingoApp extends ConsumerWidget {
  const AngLingoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'AngLingo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}