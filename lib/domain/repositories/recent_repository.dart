
import '../entities/bookmark_entity.dart';

abstract class RecentRepository {

  Future<void> recordSearch(String word, {int maxItems = 20});

  Future<List<RecentSearchEntity>> getRecents();

  Future<void> removeRecent(String word);

  Future<void> clearAll();
}