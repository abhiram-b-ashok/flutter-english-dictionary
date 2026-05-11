
import 'package:english_dictionary/data/datasources/local/sembast_database.dart';
import 'package:english_dictionary/domain/entities/bookmark_entity.dart';
import 'package:english_dictionary/domain/repositories/recent_repository.dart';

class RecentRepositoryImpl implements RecentRepository {
  final SembastDatabase _store;

  RecentRepositoryImpl(this._store);

  @override
  Future<void> recordSearch(String word, {int maxItems = 20}) async {
    await _store.upsertRecent(word);
    await _store.trimRecents(maxItems: maxItems);
  }

  @override
  Future<List<RecentSearchEntity>> getRecents() async {
    final rows = await _store.getRecents();
    return rows
        .map((row) => RecentSearchEntity(
              word:       row['word'] as String,
              searchedAt: DateTime.parse(row['searchedAt'] as String),
            ))
        .toList();
  }

  @override
  Future<void> removeRecent(String word) => _store.deleteRecent(word);

  @override
  Future<void> clearAll() => _store.clearAllRecents();
}