
import 'package:dart_mappable/dart_mappable.dart';

part 'suggestion_entity.mapper.dart';

@MappableClass()
class SuggestionEntity with SuggestionEntityMappable {
  final String word;

  final SuggestionSource source;

  const SuggestionEntity({
    required this.word,
    required this.source,
  });
}

@MappableEnum()
enum SuggestionSource {
  bundled,
  cache,
}