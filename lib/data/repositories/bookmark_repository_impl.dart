
import 'package:english_dictionary/data/datasources/local/sembast_database.dart';
import 'package:english_dictionary/domain/entities/bookmark_entity.dart';
import 'package:english_dictionary/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final SembastDatabase _store;

  BookmarkRepositoryImpl(this._store);

  @override
  Future<void> addBookmark(String word) => _store.addBookmark(word);

  @override
  Future<void> removeBookmark(String word) => _store.removeBookmark(word);

  @override
  Future<List<BookmarkEntity>> getBookmarks() async {
    final rows = await _store.getBookmarks();
    return rows
        .map((row) => BookmarkEntity(
              word:    row['word'] as String,
              savedAt: DateTime.parse(row['savedAt'] as String),
            ))
        .toList();
  }

  @override
  Future<bool> isBookmarked(String word) => _store.isBookmarked(word);

  @override
  Stream<bool> watchIsBookmarked(String word) =>
      _store.watchIsBookmarked(word);
}