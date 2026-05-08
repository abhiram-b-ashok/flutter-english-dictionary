import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'dart:convert';

class SembastDatabase {
  static Database? _database;

  static const String _wordStoreName = 'words';
  static const String _bundledStoreName = 'bundled';
  static const String _bookmarksName = 'bookmarks';
  static const String _recentsName = 'recents';
  static const String _metaName = 'meta';

  final _wordsStore = stringMapStoreFactory.store(_wordStoreName);
  final _bundledStore = stringMapStoreFactory.store(_bundledStoreName);
  final _bookmarksStore = stringMapStoreFactory.store(_bookmarksName);
  final _recentsStore = stringMapStoreFactory.store(_recentsName);
  final _metaStore = stringMapStoreFactory.store(_metaName);

  Future<Database> open() async {
    if (_database != null) return _database!;
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'anglingo.db');
    _database = await databaseFactoryIo.openDatabase(path);
    return _database!;
  }

  Database get db {
    assert(_database != null, 'Call open() before accessing db');
    return _database!;
  }

  //bundled dictioanry

  Future<bool> isBundledAdded() async {
    final meta = await _metaStore.record('bundled_added').get(db);
    return meta?['value'] == true;
  }

  Future<void> addBundledDictionary() async {
    final jsonString = await rootBundle.loadString('assets/dictionary.json');
    final Map<String, dynamic> wordMap = json.decode(jsonString);

    const setSize = 1000;
    final entries = wordMap.entries.toList();

    for (int i = 0; i < entries.length; i += setSize) {
      final set = entries.sublist(
        i,
        (i + setSize) < entries.length ? (i + setSize) : entries.length,
      );

      await db.transaction((txn) async {
        for (final entry in set) {
          final word = entry.key.toLowerCase().trim();
          if (word.isEmpty) continue;
          await _bundledStore.record(word).put(txn, {
            'word': word,
            'short': entry.value as String? ?? '',
          });
        }
      });
    }
    await _metaStore.record('bundled_added').put(db, {'value': true});
  }

  Future<Map<String, dynamic>?> getBundledWord(String word) async {
    return await _bundledStore.record(word.toLowerCase()).get(db);
  }

  Future<List<String>> searchBundled(String prefix, {int limit = 10}) async {
    final finder = Finder(
      filter: Filter.custom(
        (record) => (record.key as String).startsWith(prefix),
      ),
      limit: limit,
    );
    final records = await _bundledStore.find(db, finder: finder);
    return records.map((r) => r.key).toList();
  }

  // api cachhed

  Future<void> cacheWord(String word, Map<String, dynamic> json) async {
    await _wordsStore.record(word.toLowerCase()).put(db, json);
  }

  Future<Map<String, dynamic>?> getCachedWord(String word) async {
    return await _wordsStore.record(word.toLowerCase()).get(db);
  }

  Future<List<String>> getCachedKeys() async {
    final records = await _wordsStore.find(db);
    return records.map((r) => r.key).toList();
  }
  
  //bookmark

  Future<void> addBookmark(String word) async {
    await _bookmarksStore.record(word).put(db, {
      'word':    word,
      'savedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeBookmark(String word) async {
    await _bookmarksStore.record(word).delete(db);
  }

  Future<List<Map<String, dynamic>>> getBookmarks() async {
    final finder  = Finder(sortOrders: [SortOrder('savedAt', false)]);
    final records = await _bookmarksStore.find(db, finder: finder);
    return records.map((r) => Map<String, dynamic>.from(r.value)).toList();
  }

  Future<bool> isBookmarked(String word) async {
    return await _bookmarksStore.record(word).get(db) != null;
  }

  Stream<bool> watchIsBookmarked(String word) {
    return _bookmarksStore
        .record(word)
        .onSnapshot(db)
        .map((s) => s != null);
  }

  //recents

  Future<void> upsertRecent(String word) async {
    await _recentsStore.record(word).put(db, {
      'word':       word,
      'searchedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getRecents({int limit = 20}) async {
    final finder  = Finder(
      sortOrders: [SortOrder('searchedAt', false)],
      limit: limit,
    );
    final records = await _recentsStore.find(db, finder: finder);
    return records.map((r) => Map<String, dynamic>.from(r.value)).toList();
  }

  Future<void> deleteRecent(String word) async {
    await _recentsStore.record(word).delete(db);
  }

  Future<void> clearAllRecents() async {
    await _recentsStore.delete(db);
  }

  Future<void> trimRecents({int maxItems = 20}) async {
    final all = await getRecents(limit: 9999);
    if (all.length <= maxItems) return;
    final toDelete = all.sublist(maxItems);
    await db.transaction((txn) async {
      for (final entry in toDelete) {
        await _recentsStore.record(entry['word'] as String).delete(txn);
      }
    });
  }
}
