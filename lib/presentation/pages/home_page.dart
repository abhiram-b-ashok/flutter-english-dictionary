
import 'package:english_dictionary/core/error/failures.dart';
import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:english_dictionary/domain/entities/suggestion_entity.dart';
import 'package:english_dictionary/presentation/components/app_button.dart';
import 'package:english_dictionary/presentation/components/app_text.dart';
import 'package:english_dictionary/presentation/providers/providers.dart';
import 'package:english_dictionary/presentation/sections/definition_section.dart';
import 'package:english_dictionary/presentation/widgets/search_bar_widget.dart';
import 'package:english_dictionary/presentation/widgets/word_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final isOnline = ref.watch(isOnlineProvider).value ?? true;
    final searchState = ref.watch(searchProvider);
    final themeMode = ref.watch(themeModeProvider);

    ref.listen(searchSubmitProvider, (_, next) async {
      switch (next) {
        case SearchSubmitFound(:final word):

          await context.push(
            '/word/${Uri.encodeComponent(word.word)}',
            extra: word,
          );
          ref.invalidate(recentsProvider);
          ref.read(searchSubmitProvider.notifier).reset();
        default:
          break;
      }
    });

    final submitState = ref.watch(searchSubmitProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AngLingo',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w900,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: () =>
                ref.read(themeModeProvider.notifier).toggle(),
            tooltip: 'Toggle theme',
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_rounded),
            onPressed: () => context.push('/bookmarks'),
            tooltip: 'Bookmarks',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Offline indicator
          if (!isOnline) const OfflineBanner(),

          if (submitState is SearchSubmitNotFound)
            _NotFoundBanner(query: submitState.query),

          if (submitState is SearchSubmitError)
            _ErrorBanner(
              error: submitState.error,
              onRetry: () => ref
                  .read(searchSubmitProvider.notifier)
                  .submit(submitState.query),
            ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: SearchBarWidget(
                      onSubmitted: (word) => ref
                          .read(searchSubmitProvider.notifier)
                          .submit(word),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: searchState.when(
              
                    loading: () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SearchSuggestionsSection(
                        suggestions: const <SuggestionEntity>[],
                        isLoading: true,
                        onWordTap: (w) => ref
                            .read(searchSubmitProvider.notifier)
                            .submit(w),
                      ),
                    ),
                    error: (_, _) => const SizedBox.shrink(),
                    data: (List<SuggestionEntity> suggestions) {
                      if (suggestions.isEmpty) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SearchSuggestionsSection(
                          suggestions: suggestions,
                          isLoading: false,
                          onWordTap: (w) => ref
                              .read(searchSubmitProvider.notifier)
                              .submit(w),
                        ),
                      );
                    },
                  ),
                ),

                _RecentsSection(
                  onWordTap: (w) => ref
                      .read(searchSubmitProvider.notifier)
                      .submit(w),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _NotFoundBanner extends StatelessWidget {
  final String query;
  const _NotFoundBanner({required this.query});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.divider),
      ),
      child: Row(
        children: [
          Icon(Icons.menu_book_rounded, size: 20, color: colors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"$query" not found in the dictionary',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colors.textPrimary,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Check the spelling or try a different word.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 250.ms).slideY(begin: -0.2, end: 0);
  }
}

 
class _ErrorBanner extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;
  const _ErrorBanner({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final message = switch (error) {
      OfflineException()  => 'You\'re offline. Connect to search online.',
      NetworkException()  => 'Connection problem. Check your network.',
      _                   => 'Something went wrong. Please try again.',
    };

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border:       Border.all(color: colors.divider),
      ),
      child: Row(
        children: [
          Icon(Icons.wifi_off_rounded, size: 18, color: colors.textHint),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.textSecondary,
                  ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: TextStyle(
                color:      colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 250.ms).slideY(begin: -0.2, end: 0);
  }
}


class _RecentsSection extends ConsumerWidget {
  final ValueChanged<String> onWordTap;
  const _RecentsSection({required this.onWordTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors       = Theme.of(context).extension<AppColors>()!;
    final searchState  = ref.watch(searchProvider);
    final recentsAsync = ref.watch(recentsProvider);

    // Only show recents when the search bar has no active suggestions
    final showRecents = searchState.value?.isEmpty ?? true;
    if (!showRecents) return const SliverToBoxAdapter(child: SizedBox.shrink());

    return recentsAsync.when(
      loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
      error:   (_, _) => const SliverToBoxAdapter(child: SizedBox.shrink()),
      data: (recents) {
        if (recents.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: _EmptyHomeState(),
          );
        }

        return SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TitleText(
                      'Recent Searches',
                      color: colors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        ref.read(recentsProvider.notifier).clearAll(),
                    child: CaptionText('Clear all', color: colors.primary),
                  ),
                ],
              ),
            ),
            ...recents.asMap().entries.map(
                  (e) => RecentTile(
                    word: e.value.word,
                    onTap: () => onWordTap(e.value.word),
                    onRemove: () => ref
                        .read(recentsProvider.notifier)
                        .remove(e.value.word),
                  )
                      .animate(delay: (e.key * 40).ms)
                      .fadeIn(duration: 300.ms)
                      .slideX(begin: 0.1, end: 0),
                ),
          ]),
        );
      },
    );
  }
}


class _EmptyHomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size:  64,
            color: colors.textHint.withValues(alpha: .4),
          ),
          const SizedBox(height: 16),
          TitleText('Search any English word', color: colors.textHint),
          const SizedBox(height: 8),
          CaptionText(
            'Works offline too',
            color: colors.textHint.withValues(alpha: .7),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 500.ms)
        .scale(begin: const Offset(0.95, 0.95));
  }
}