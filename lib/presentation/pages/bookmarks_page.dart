

import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:english_dictionary/domain/entities/bookmark_entity.dart';
import 'package:english_dictionary/presentation/components/app_text.dart';
import 'package:english_dictionary/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';


class BookmarksPage extends ConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bookmarksAsync = ref.watch(bookmarkProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Bookmarks'),
        actions: [
          bookmarksAsync.whenOrNull(
                data: (list) => list.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.delete_sweep_rounded),
                        tooltip: 'Remove all bookmarks',
                        onPressed: () => _confirmClearAll(context, ref),
                      )
                    : null,
              ) ??
              const SizedBox.shrink(),
          const SizedBox(width: 8),
        ],
      ),
      body: bookmarksAsync.when(
        loading: () => const _BookmarksShimmer(),
        error: (e, _) => _ErrorState(message: e.toString()),
        data: (bookmarks) => bookmarks.isEmpty
            ? const _EmptyState()
            : _BookmarksList(bookmarks: bookmarks),
      ),
    );
  }

  Future<void> _confirmClearAll(BuildContext context, WidgetRef ref) async {
    final colors = Theme.of(context).extension<AppColors>()!;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Theme.of(context).extension<AppColors>()!.surface,
        title: const TitleText('Remove all bookmarks?'),
        content: const BodyText(
          'This will remove all your saved words. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              'Cancel',
              style: TextStyle(color: colors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              'Remove all',
              style: TextStyle(
                color: colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {

      final bookmarks =
          ref.read(bookmarkProvider).whenOrNull(data: (list) => list) ??
          [];
      for (final b in bookmarks) {
        await ref.read(bookmarkRepositoryProvider).removeBookmark(b.word);
      }
      ref.invalidate(bookmarkProvider);
    }
  }
}


class _BookmarksList extends ConsumerWidget {
  final List<BookmarkEntity> bookmarks;
  const _BookmarksList({required this.bookmarks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: bookmarks.length,
      separatorBuilder: (_, _) =>
          Divider(color: colors.divider, height: 1, indent: 72, endIndent: 20),
      itemBuilder: (context, index) {
        final bookmark = bookmarks[index];

        return Dismissible(
          key: ValueKey(bookmark.word),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 24),
            color: Colors.red.shade400,
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          onDismissed: (_) {
            ref.read(bookmarkProvider.notifier).toggle(bookmark.word);
          },
          child: _BookmarkTile(bookmark: bookmark, index: index),
        );
      },
    );
  }
}


class _BookmarkTile extends StatelessWidget {
  final BookmarkEntity bookmark;
  final int index;

  const _BookmarkTile({required this.bookmark, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return InkWell(
          onTap: () =>
              context.push('/word/${Uri.encodeComponent(bookmark.word)}'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.bookmark_rounded,
                    size: 20,
                    color: colors.primary,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(bookmark.word),
                      const SizedBox(height: 2),
                      CaptionText(
                        _formatDate(bookmark.savedAt),
                        color: colors.textHint,
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.chevron_right_rounded,
                  color: colors.textHint,
                  size: 20,
                ),
              ],
            ),
          ),
        )
        .animate(delay: (index * 50).ms)
        .fadeIn(duration: 300.ms)
        .slideX(begin: 0.08, end: 0, curve: Curves.easeOutCubic);
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return 'Saved today';
    if (diff.inDays == 1) return 'Saved yesterday';
    if (diff.inDays < 7) return 'Saved ${diff.inDays} days ago';
    if (diff.inDays < 30) return 'Saved ${(diff.inDays / 7).floor()} weeks ago';
    return 'Saved ${(diff.inDays / 30).floor()} months ago';
  }
}


class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmark_border_rounded,
                size: 72,
                color: colors.textHint.withValues(alpha: .35),
              ),
              const SizedBox(height: 20),
              TitleText('No bookmarks yet', color: colors.textHint),
              const SizedBox(height: 8),
              CaptionText(
                'Tap the bookmark icon on any word\nto save it here.',
                color: colors.textHint.withValues(alpha: .7),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: 100.ms, duration: 500.ms)
        .scale(begin: const Offset(0.95, 0.95));
  }
}


class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 52,
              color: colors.textHint.withValues(alpha: .4),
            ),
            const SizedBox(height: 16),
            TitleText('Could not load bookmarks', color: colors.textPrimary),
            const SizedBox(height: 8),
            CaptionText(message, color: colors.textSecondary),
          ],
        ),
      ),
    );
  }
}


class _BookmarksShimmer extends StatelessWidget {
  const _BookmarksShimmer();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Shimmer.fromColors(
      baseColor: colors.surfaceVariant,
      highlightColor: colors.surface,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: 7,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120 + (index % 3) * 30.0,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 80,
                      height: 11,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
