
import '../entities/word_entity.dart';
import '../entities/suggestion_entity.dart';

abstract class DictionaryRepository {
 
  Future<WordEntity> getWord(String word);

  Future<List<SuggestionEntity>> suggest(String prefix, {int limit = 10});
}