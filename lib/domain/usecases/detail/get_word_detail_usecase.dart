
import '../../entities/word_entity.dart';
import '../../repositories/dictionary_repository.dart';
import '../../repositories/recent_repository.dart';

class GetWordDetailUseCase {
  
  final DictionaryRepository _dictionaryRepository;
  final RecentRepository _recentRepository;

  GetWordDetailUseCase(this._dictionaryRepository, this._recentRepository);

  Future<WordEntity> call(String word) async {

    final result = await _dictionaryRepository.getWord(word.toLowerCase().trim());

    _recentRepository.recordSearch(word.toLowerCase().trim()).ignore();

    return result;
  }
}