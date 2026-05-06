
import '../../entities/suggestion_entity.dart';
import '../../repositories/dictionary_repository.dart';

class SearchSuggestionsUseCase {

  final DictionaryRepository _dictionaryRepository;

  SearchSuggestionsUseCase(this._dictionaryRepository);

  Future<List<SuggestionEntity>> call(String prefix) async {
    if (prefix.trim().isEmpty) return [];

    return _dictionaryRepository.suggest(
      prefix.toLowerCase().trim(),
      limit: 8, 
    );
  }
}