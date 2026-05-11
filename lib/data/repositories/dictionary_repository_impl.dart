
import 'package:english_dictionary/core/error/failures.dart';
import 'package:english_dictionary/core/network/network_checker.dart';
import 'package:english_dictionary/data/datasources/local/sembast_database.dart';
import 'package:english_dictionary/data/datasources/remote/dictionary_remote_datasource.dart';
import 'package:english_dictionary/domain/entities/suggestion_entity.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'package:english_dictionary/domain/repositories/dictionary_repository.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryRemoteDatasource _remote;
  final SembastDatabase _local;
  final NetworkChecker _network;

  DictionaryRepositoryImpl({
    required DictionaryRemoteDatasource remote,
    required SembastDatabase local,
    required NetworkChecker network,
  })  : _remote = remote,
        _local = local,
        _network = network;

  @override
  Future<WordEntity> getWord(String word) async {

    final cached = await _local.getCachedWord(word);
    if (cached != null) {
      return _wordEntityFromCacheJson(cached, WordSource.cache);
    }

    final online = await _network.isOnline;

    if (online) {
      final entity = await _remote.getWord(word);
      await _local.cacheWord(word, _wordEntityToCacheJson(entity));

      return entity;
    }

    final bundled = await _local.getBundledWord(word);
    if (bundled != null) {
      return _wordEntityFromBundledJson(bundled, word);
    }
    throw WordNotFoundException(word: word);
  }

  @override
  Future<List<SuggestionEntity>> suggest(
      String prefix, {int limit = 10}) async {

    final results = await Future.wait([
      _local.searchBundled(prefix, limit: limit),
      _local.getCachedWordKeys(),
    ]);

    final bundledWords = results[0];
    final cachedWords  = results[1];

    final matchingCached = cachedWords
        .where((w) => w.startsWith(prefix))
        .toList();

    final seen = <String>{};
    final suggestions = <SuggestionEntity>[];

    for (final w in matchingCached) {
      if (seen.add(w)) {
        suggestions.add(SuggestionEntity(
          word: w,
          source: SuggestionSource.cache,
        ));
      }
    }

    for (final w in bundledWords) {
      if (seen.add(w) && suggestions.length < limit) {
        suggestions.add(SuggestionEntity(
          word: w,
          source: SuggestionSource.bundled,
        ));
      }
    }

    suggestions.sort((a, b) => a.word.compareTo(b.word));
    return suggestions.take(limit).toList();
  }

  Map<String, dynamic> _wordEntityToCacheJson(WordEntity entity) {
    return {
      'word': entity.word,
      'phonetic': entity.phonetic,
      'phonetics': entity.phonetics
          .map((p) => {'text': p.text, 'audioUrl': p.audioUrl})
          .toList(),
      'meanings': entity.meanings
          .map((m) => {
                'partOfSpeech': m.partOfSpeech,
                'synonyms': m.synonyms,
                'antonyms': m.antonyms,
                'definitions': m.definitions
                    .map((d) => {
                          'definition': d.definition,
                          'example': d.example,
                          'synonyms': d.synonyms,
                          'antonyms': d.antonyms,
                        })
                    .toList(),
              })
          .toList(),
    };
  }

  WordEntity _wordEntityFromCacheJson(
      Map<String, dynamic> json, WordSource source) {
    return WordEntity(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String?,
      source: source,
      phonetics: (json['phonetics'] as List<dynamic>)
          .map((p) => PhoneticEntity(
                text: p['text'] as String?,
                audioUrl: p['audioUrl'] as String?,
              ))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>)
          .map((m) => MeaningEntity(
                partOfSpeech: m['partOfSpeech'] as String,
                synonyms: List<String>.from(m['synonyms'] as List),
                antonyms: List<String>.from(m['antonyms'] as List),
                definitions: (m['definitions'] as List<dynamic>)
                    .map((d) => DefinitionEntity(
                          definition: d['definition'] as String,
                          example: d['example'] as String?,
                          synonyms: List<String>.from(d['synonyms'] as List),
                          antonyms: List<String>.from(d['antonyms'] as List),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }

  WordEntity _wordEntityFromBundledJson(
      Map<String, dynamic> json, String word) {
    final shortDef = json['short'] as String? ??
        json['definition'] as String? ??
        'Definition available online only.';

    return WordEntity(
      word:word,
      phonetic: null,
      phonetics: const [],
      source:WordSource.bundled,
      meanings: [
        MeaningEntity( 
          partOfSpeech: 'definition',
          synonyms: const [],
          antonyms: const [],
          definitions: [
            DefinitionEntity(
              definition: shortDef,
              synonyms: const [],
              antonyms: const [],
            ),
          ],
        ),
      ],
    );
  }
}