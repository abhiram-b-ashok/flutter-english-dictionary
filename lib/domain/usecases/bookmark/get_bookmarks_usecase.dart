
import '../../entities/bookmark_entity.dart';
import '../../repositories/bookmark_repository.dart';

class GetBookmarksUseCase {
  
  final BookmarkRepository _bookmarkRepository;

  GetBookmarksUseCase(this._bookmarkRepository);

  Future<List<BookmarkEntity>> call() => _bookmarkRepository.getBookmarks();
}