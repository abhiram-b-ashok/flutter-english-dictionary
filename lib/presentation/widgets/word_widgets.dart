
import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:english_dictionary/domain/entities/suggestion_entity.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'package:english_dictionary/presentation/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:english_dictionary/presentation/components/app_button.dart';


class SuggestionTile extends StatelessWidget {
  final SuggestionEntity suggestion;
  final VoidCallback onTap;

  const SuggestionTile({
    super.key,
    required this.suggestion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final isCached = suggestion.source == SuggestionSource.cache;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              isCached
                  ? Icons.history_rounded
                  : Icons.menu_book_rounded,
              size: 18,
              color: colors.textHint,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TitleText(suggestion.word),
            ),
            Icon(Icons.north_west_rounded, size: 14, color: colors.textHint),
          ],
        ),
      ),
    );
  }
}


class PhoneticRow extends ConsumerWidget {
  final PhoneticEntity phonetic;
  final bool isPlaying;
  final VoidCallback? onPlayTap;

  const PhoneticRow({
    super.key,
    required this.phonetic,
    this.isPlaying = false,
    this.onPlayTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (phonetic.text != null)
          Text(
            phonetic.text!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colors.phoneticText,
                  fontFamily: 'serif',
                ),
          ),
        if (phonetic.hasAudio) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onPlayTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isPlaying
                    ? colors.primary
                    : colors.primaryLight,
              ),
              child: Icon(
                isPlaying
                    ? Icons.stop_rounded
                    : Icons.volume_up_rounded,
                size: 18,
                color: isPlaying ? colors.onPrimary : colors.primary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}


class WordHeaderWidget extends StatelessWidget {
  final WordEntity word;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;
  final VoidCallback? onAudioTap;

  const WordHeaderWidget({
    super.key,
    required this.word,
    required this.isBookmarked,
    required this.onBookmarkTap,
    this.onAudioTap
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    final audioPhonetic = word.phonetics.firstWhere(
      (p) => p.hasAudio,
      orElse: () => word.phonetics.isNotEmpty
          ? word.phonetics.first
          : const PhoneticEntity(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DisplayText(word.word),
            ),
            IconButton(
              onPressed: onBookmarkTap,
              icon: Icon(
                isBookmarked
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                size: 24,
                color: isBookmarked
                    ? colors.bookmarkActive
                    : colors.bookmarkInactive,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            if (audioPhonetic.text != null || audioPhonetic.hasAudio)
              PhoneticRow(phonetic: audioPhonetic, onPlayTap: onAudioTap,),
            const Spacer(),
            // Source badge — tells user where data came from
            switch (word.source) {
              WordSource.remote  => SourceBadge.remote(),
              WordSource.cache => SourceBadge.cache(),
              WordSource.bundled => SourceBadge.bundled(),
            },
          ],
        ),
      ],
    );
  }
}


class RecentTile extends StatelessWidget {
  final String word;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const RecentTile({
    super.key,
    required this.word,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.access_time_rounded, size: 16, color: colors.textHint),
            const SizedBox(width: 12),
            Expanded(child: TitleText(word)),
            GestureDetector(
              onTap: onRemove,
              child: Icon(Icons.close_rounded, size: 16, color: colors.textHint),
            ),
          ],
        ),
      ),
    );
  }
}