
import 'package:english_dictionary/domain/entities/suggestion_entity.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'package:english_dictionary/presentation/components/app_button.dart';
import 'package:english_dictionary/presentation/components/app_text.dart';
import 'package:flutter/material.dart';


class DefinitionSection extends StatelessWidget {
  final List<MeaningEntity> meanings;
  const DefinitionSection({super.key, required this.meanings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < meanings.length; i++) ...[
          _MeaningBlock(meaning: meanings[i]),
          if (i < meanings.length - 1) const HorizontalDivider(),
        ],
      ],
    );
  }
}

class _MeaningBlock extends StatelessWidget {
  final MeaningEntity meaning;
  const _MeaningBlock({required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PartOfSpeechBadge(meaning.partOfSpeech),
        const SizedBox(height: 16),

        for (int i = 0; i < meaning.definitions.length; i++)
          _DefinitionItem(number: i + 1, definition: meaning.definitions[i]),

        if (meaning.synonyms.isNotEmpty) ...[
          const SizedBox(height: 12),
          _WordChipRow(label: 'Synonyms', words: meaning.synonyms),
        ],
        if (meaning.antonyms.isNotEmpty) ...[
          const SizedBox(height: 8),
          _WordChipRow(label: 'Antonyms', words: meaning.antonyms),
        ],
      ],
    );
  }
}

class _DefinitionItem extends StatelessWidget {
  final int number;
  final DefinitionEntity definition;
  const _DefinitionItem({required this.number, required this.definition});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(top: 2, right: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: .12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: theme.textTheme.labelSmall?.copyWith(
                  color:       theme.colorScheme.primary,
                  fontWeight:  FontWeight.w700,
                ),
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(definition.definition),
                if (definition.example != null) ...[
                  const SizedBox(height: 6),
                  ExampleText(definition.example!),
                ],
                if (definition.synonyms.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _WordChipRow(label: 'Synonyms', words: definition.synonyms),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WordChipRow extends StatelessWidget {
  final String label;
  final List<String> words;
  const _WordChipRow({required this.label, required this.words});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 8),
          child: CaptionText(
            '$label:',
            color: theme.colorScheme.onSurface.withValues(alpha: .5),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 6,
            runSpacing: 4,
            children: words
                .take(8)
                .map((w) => Chip(
                      label: Text(w),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}


class SearchSuggestionsSection extends StatelessWidget {
  final List<SuggestionEntity> suggestions;
  final bool isLoading;
  final ValueChanged<String> onWordTap;

  const SearchSuggestionsSection({
    super.key,
    required this.suggestions,
    required this.isLoading,
    required this.onWordTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    if (!isLoading && suggestions.isEmpty) return const SizedBox.shrink();

    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).cardColor,
      shadowColor: cs.primary.withValues(alpha:0.15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: suggestions.length,
                separatorBuilder: (_, _) => const HorizontalDivider(),
                itemBuilder: (context, index) {
                  final s = suggestions[index]; 
                  final isCached = s.source == SuggestionSource.cache;
                  return InkWell(
                    onTap: () => onWordTap(s.word),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isCached ? Icons.history_rounded : Icons.menu_book_rounded,
                            size: 18,
                            color: cs.onSurface.withValues(alpha: .4),
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: TitleText(s.word)),
                          Icon(
                            Icons.north_west_rounded,
                            size: 14,
                            color: cs.onSurface.withValues(alpha: .4),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}