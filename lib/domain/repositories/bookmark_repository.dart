
import '../entities/bookmark_entity.dart';

abstract class BookmarkRepository {

  Future<void> addBookmark(String word);

  Future<void> removeBookmark(String word);

  Future<List<BookmarkEntity>> getBookmarks();

  Future<bool> isBookmarked(String word);

  Stream<bool> watchIsBookmarked(String word);
}