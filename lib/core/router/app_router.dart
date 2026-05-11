import 'package:go_router/go_router.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'package:english_dictionary/presentation/pages/bookmarks_page.dart';
import 'package:english_dictionary/presentation/pages/home_page.dart';
import 'package:english_dictionary/presentation/pages/splash_page.dart';
import 'package:english_dictionary/presentation/pages/word_detail_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
     routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => const SplashPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, _) => const HomePage(),
      ),
      GoRoute(
        path: '/word/:word',
        builder: (context, state) {
          final word         = Uri.decodeComponent(state.pathParameters['word'] ?? '');
          final preloaded    = state.extra as WordEntity?;
          return WordDetailPage(word: word, preloadedWord: preloaded);
        },
      ),
      GoRoute(
        path: '/bookmarks',
        builder: (_, _) => const BookmarksPage(),
      ),
    ],
  );
}
