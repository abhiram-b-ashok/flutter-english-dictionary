
import 'package:dart_mappable/dart_mappable.dart';

part 'bookmark_entity.mapper.dart';

@MappableClass()
class BookmarkEntity with BookmarkEntityMappable {
  final String word;
  final DateTime savedAt;

  const BookmarkEntity({
    required this.word,
    required this.savedAt,
  });
}

@MappableClass()
class RecentSearchEntity with RecentSearchEntityMappable {
  final String word;
  final DateTime searchedAt;

  const RecentSearchEntity({
    required this.word,
    required this.searchedAt,
  });
}