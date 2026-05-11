
import 'package:english_dictionary/core/error/failures.dart';
import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'package:english_dictionary/presentation/components/app_button.dart';
import 'package:english_dictionary/presentation/components/app_text.dart';
import 'package:english_dictionary/presentation/providers/providers.dart';
import 'package:english_dictionary/presentation/sections/definition_section.dart';
import 'package:english_dictionary/presentation/widgets/word_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';


class WordDetailPage extends ConsumerWidget {
  final String word;

  final WordEntity? preloadedWord;

  const WordDetailPage({
    super.key,
    required this.word,
    this.preloadedWord,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isOnline     = ref.watch(isOnlineProvider).value ?? true;
    final isBookmarked = ref.watch(isWordBookmarkedProvider(word)).value ?? false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(word),
      
      ),
      body: Column(
        children: [
          if (!isOnline) const OfflineBanner(),
          Expanded(
            child: preloadedWord != null
                ? _WordDetailBody(
                    word:          preloadedWord!,
                    isBookmarked:  isBookmarked,
                    onBookmarkTap: () => ref
                        .read(bookmarkProvider.notifier)
                        .toggle(word),
                  )
                : _FetchingBody(
                    word:          word,
                    isBookmarked:  isBookmarked,
                    onBookmarkTap: () => ref
                        .read(bookmarkProvider.notifier)
                        .toggle(word),
                    ref:           ref,
                  ),
          ),
        ],
      ),
    );
  }
}


class _FetchingBody extends ConsumerWidget {
  final String word;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;
  final WidgetRef ref;

  const _FetchingBody({
    required this.word,
    required this.isBookmarked,
    required this.onBookmarkTap,
    required this.ref,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(wordDetailProvider(word));

    return detailAsync.when(
      loading: () => const _WordDetailShimmer(),
      error: (error, _) => switch (error) {

        WordNotFoundException() => _WordNotFoundView(word: word), _ => _ErrorView(
            error:   error,
            word:    word,
            onRetry: () =>
                ref.read(wordDetailProvider(word).notifier).retry(),
          ),
      },
      data: (entity) => _WordDetailBody(
        word:          entity,
        isBookmarked:  isBookmarked,
        onBookmarkTap: onBookmarkTap,
      ),
    );
  }
}


class _WordDetailBody extends ConsumerWidget {
  final WordEntity word;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  const _WordDetailBody({
    required this.word,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WordHeaderWidget(
            word:          word,
            isBookmarked:  isBookmarked,
            onBookmarkTap: onBookmarkTap,
             onAudioTap: () {
              final audioUrl = word.phonetics
                  .firstWhere((p) => p.hasAudio, orElse: () => const PhoneticEntity())
                  .audioUrl;

              if (audioUrl != null && audioUrl.isNotEmpty) {
                ref.read(audioPlayerProvider.notifier).play(audioUrl);
              }
            },
          ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.08, end: 0),
          const SizedBox(height: 24),
          DefinitionSection(meanings: word.meanings)
              .animate(delay: 100.ms)
              .fadeIn(duration: 350.ms),
        ],
      ),
    );
  }
}



class _WordNotFoundView extends StatelessWidget {
  final String word;
  const _WordNotFoundView({required this.word});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.menu_book_rounded,
                size:  40,
                color: colors.primary,
              ),
            )
                .animate()
                .scale(
                  begin: const Offset(0.7, 0.7),
                  duration: 450.ms,
                  curve: Curves.elasticOut,
                ),

            const SizedBox(height: 20),

            // Show the word back so user knows what was searched
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color:        colors.surfaceVariant,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                '"$word"',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:      colors.textSecondary,
                      fontStyle:  FontStyle.italic,
                    ),
              ),
            ).animate(delay: 100.ms).fadeIn(duration: 300.ms),

            const SizedBox(height: 14),

            TitleText(
              'Word not found',
              color: colors.textPrimary,
            ).animate(delay: 150.ms).fadeIn(duration: 300.ms),

            const SizedBox(height: 8),

            Text(
              'This word isn\'t in the dictionary.\nCheck the spelling or try a different word.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:  colors.textSecondary,
                    height: 1.6,
                  ),
            ).animate(delay: 200.ms).fadeIn(duration: 300.ms),

            const SizedBox(height: 28),

            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon:  const Icon(Icons.arrow_back_rounded, size: 18),
              label: const Text('Search again'),
              style: OutlinedButton.styleFrom(
                foregroundColor: colors.primary,
                side:  BorderSide(color: colors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical:   12,
                ),
              ),
            ).animate(delay: 250.ms).fadeIn(duration: 300.ms),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final Object error;
  final String word;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.error,
    required this.word,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    final (icon, title, subtitle) = switch (error) {
      OfflineException() => (
          Icons.wifi_off_rounded,
          'You\'re offline',
          '"$word" isn\'t cached yet.\nConnect to look it up.',
        ),
      NetworkException(statusCode: final code) => (
          Icons.cloud_off_rounded,
          'Connection problem',
          'Something went wrong${code != null ? ' ($code)' : ''}.\nTry again.',
        ),
      _ => (
          Icons.error_outline_rounded,
          'Something went wrong',
          'An unexpected error occurred.',
        ),
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 52, color: colors.textHint.withValues(alpha: .4))
                .animate().fadeIn(duration: 350.ms),
            const SizedBox(height: 20),
            TitleText(title, color: colors.textPrimary)
                .animate(delay: 80.ms).fadeIn(duration: 300.ms),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.textSecondary, height: 1.6,
                  ),
            ).animate(delay: 120.ms).fadeIn(duration: 300.ms),
            const SizedBox(height: 28),
            PrimaryButton(label: 'Try again', onPressed: onRetry)
                .animate(delay: 160.ms).fadeIn(duration: 300.ms),
          ],
        ),
      ),
    );
  }
}


class _WordDetailShimmer extends StatelessWidget {
  const _WordDetailShimmer();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Shimmer.fromColors(
      baseColor:      colors.surfaceVariant,
      highlightColor: colors.surface,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Box(width: 200, height: 40),
            const SizedBox(height: 12),
            _Box(width: 120, height: 24),
            const SizedBox(height: 28),
            _Box(width: 80,  height: 30, radius: 50),
            const SizedBox(height: 16),
            for (int i = 0; i < 5; i++) ...[
              _Box(width: double.infinity, height: 16),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

class _Box extends StatelessWidget {
  final double width, height;
  final double radius;
  const _Box({required this.width, required this.height, this.radius = 8});

  @override
  Widget build(BuildContext context) => Container(
        width: width, height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
}