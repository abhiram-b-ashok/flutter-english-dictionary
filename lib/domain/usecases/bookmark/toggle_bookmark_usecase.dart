
import '../../repositories/bookmark_repository.dart';

class ToggleBookmarkUseCase {
  final BookmarkRepository _bookmarkRepository;

  ToggleBookmarkUseCase(this._bookmarkRepository);

  Future<bool> call(String word) async {

    final alreadyBookmarked = await _bookmarkRepository.isBookmarked(word);

    if (alreadyBookmarked) {
      await _bookmarkRepository.removeBookmark(word);
      return false; 
    } else {
      await _bookmarkRepository.addBookmark(word);
      return true; 
    }
  }
}