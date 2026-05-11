
import 'dart:async';
import 'package:english_dictionary/core/error/failures.dart';
import 'package:english_dictionary/core/network/network_checker.dart';
import 'package:english_dictionary/data/datasources/local/sembast_database.dart';
import 'package:english_dictionary/data/datasources/remote/chopper_client_factory.dart';
import 'package:english_dictionary/data/datasources/remote/dictionary_chopper_service.dart';
import 'package:english_dictionary/data/datasources/remote/dictionary_remote_datasource.dart';
import 'package:english_dictionary/data/repositories/bookmark_repository_impl.dart';
import 'package:english_dictionary/data/repositories/dictionary_repository_impl.dart';
import 'package:english_dictionary/data/repositories/recent_repository_impl.dart';
import 'package:english_dictionary/domain/entities/bookmark_entity.dart';
import 'package:english_dictionary/domain/entities/suggestion_entity.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'package:english_dictionary/domain/repositories/bookmark_repository.dart';
import 'package:english_dictionary/domain/repositories/dictionary_repository.dart';
import 'package:english_dictionary/domain/repositories/recent_repository.dart';
import 'package:english_dictionary/domain/usecases/bookmark/get_bookmarks_usecase.dart';
import 'package:english_dictionary/domain/usecases/bookmark/toggle_bookmark_usecase.dart';
import 'package:english_dictionary/domain/usecases/detail/get_word_detail_usecase.dart';
import 'package:english_dictionary/domain/usecases/recent/get_recents_usecase.dart';
import 'package:english_dictionary/domain/usecases/search/search_suggestions_usecase.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audioplayers/audioplayers.dart';


part 'providers.g.dart';

@Riverpod(keepAlive: true)
SembastDatabase sembastStore(Ref ref) {
  throw UnimplementedError(
    'Override sembastStoreProvider in ProviderScope before runApp().',
  );
}

@Riverpod(keepAlive: true)
DictionaryChopperService chopperService(Ref ref) {
  final client = buildChopperClient();
  ref.onDispose(client.dispose);
  return client.getService<DictionaryChopperService>();
}

@Riverpod(keepAlive: true)
NetworkChecker networkChecker(Ref ref) => NetworkCheckerImpl();


@Riverpod(keepAlive: true)
DictionaryRemoteDatasource remoteDataSource(Ref ref) =>
    DictionaryRemoteDatasourceImpl(ref.watch(chopperServiceProvider));

// Repositories

@Riverpod(keepAlive: true)
DictionaryRepository dictionaryRepository(Ref ref) =>
    DictionaryRepositoryImpl(
      remote:  ref.watch(remoteDataSourceProvider),
      local:   ref.watch(sembastStoreProvider),
      network: ref.watch(networkCheckerProvider),
    );

@Riverpod(keepAlive: true)
BookmarkRepository bookmarkRepository(Ref ref) =>
    BookmarkRepositoryImpl(ref.watch(sembastStoreProvider));

@Riverpod(keepAlive: true)
RecentRepository recentRepository(Ref ref) =>
    RecentRepositoryImpl(ref.watch(sembastStoreProvider));

// Use cases

@Riverpod(keepAlive: true)
GetWordDetailUseCase getWordDetailUseCase(Ref ref) => GetWordDetailUseCase(
      ref.watch(dictionaryRepositoryProvider),
      ref.watch(recentRepositoryProvider),
    );

@Riverpod(keepAlive: true)
SearchSuggestionsUseCase searchSuggestionsUseCase(Ref ref) =>
    SearchSuggestionsUseCase(ref.watch(dictionaryRepositoryProvider));

@Riverpod(keepAlive: true)
ToggleBookmarkUseCase toggleBookmarkUseCase(Ref ref) =>
    ToggleBookmarkUseCase(ref.watch(bookmarkRepositoryProvider));

@Riverpod(keepAlive: true)
GetBookmarksUseCase getBookmarksUseCase(Ref ref) =>
    GetBookmarksUseCase(ref.watch(bookmarkRepositoryProvider));

@Riverpod(keepAlive: true)
GetRecentsUseCase getRecentsUseCase(Ref ref) =>
    GetRecentsUseCase(ref.watch(recentRepositoryProvider));


// App state
@riverpod
Stream<bool> isOnline(Ref ref) =>
    ref.watch(networkCheckerProvider).onConnectivityChanged;

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() => ThemeMode.system;

  void toggle() =>
      state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

  void setMode(ThemeMode mode) => state = mode;
}

// audio
@Riverpod(keepAlive: true)
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  late AudioPlayer _player;

  @override
  bool build() {
    _player = AudioPlayer();
    _player.onPlayerComplete.listen((_) => state = false);
    ref.onDispose(() => _player.dispose());
    return false;
  }

  Future<void> play(String url) async {
    try {
      final cleanUrl = url.startsWith('//') ? 'https:$url' : url;

      state = true;
      await _player.stop();
      await _player.play(UrlSource(cleanUrl));
    } catch (e) {
      state = false;
      debugPrint("Audio Error: $e");
    }
  }

  Future<void> stop() async {
    await _player.stop();
    state = false;
  }
}

// Search
@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  FutureOr<List<SuggestionEntity>> build() async => const [];

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(searchSuggestionsUseCaseProvider).call(query),
    );
  }

  void clear() => state = const AsyncData([]);
}


// Search submit
sealed class SearchSubmitState {
  const SearchSubmitState();
}

class SearchSubmitIdle extends SearchSubmitState {
  const SearchSubmitIdle();
}

class SearchSubmitLoading extends SearchSubmitState {
  const SearchSubmitLoading();
}

class SearchSubmitFound extends SearchSubmitState {
  final WordEntity word;
  const SearchSubmitFound(this.word);
}

class SearchSubmitNotFound extends SearchSubmitState {
  final String query;
  const SearchSubmitNotFound(this.query);
}

class SearchSubmitError extends SearchSubmitState {
  final Object error;
  final String query;
  const SearchSubmitError(this.error, this.query);
}

@riverpod
class SearchSubmitNotifier extends _$SearchSubmitNotifier {
  @override
  SearchSubmitState build() => const SearchSubmitIdle();

  Future<void> submit(String word) async {
    final trimmed = word.trim().toLowerCase();
    if (trimmed.isEmpty) return;

    state = const SearchSubmitLoading();

    try {
      final result =
          await ref.read(getWordDetailUseCaseProvider).call(trimmed);

      state = SearchSubmitFound(result);
    } on WordNotFoundException {
      state = SearchSubmitNotFound(trimmed);
    } on OfflineException catch (e) {
      state = SearchSubmitError(e, trimmed);
    } on NetworkException catch (e) {
      state = SearchSubmitError(e, trimmed);
    } catch (e) {
      state = SearchSubmitError(e, trimmed);
    }
  }

  void reset() => state = const SearchSubmitIdle();
}


// WORD DETAIL
@riverpod
class WordDetail extends _$WordDetail {
  @override
  Future<WordEntity> build(String word) =>
      ref.read(getWordDetailUseCaseProvider).call(word);

  Future<void> retry() {
    ref.invalidateSelf();
    return future;
  }
}


// BOOKMARKS
@Riverpod(keepAlive: true)
class BookmarkNotifier extends _$BookmarkNotifier {
  @override
  Future<List<BookmarkEntity>> build() =>
      ref.read(getBookmarksUseCaseProvider).call();

  Future<void> toggle(String word) async {
    await ref.read(toggleBookmarkUseCaseProvider).call(word);
    ref.invalidateSelf();
  }
}

@riverpod
Stream<bool> isWordBookmarked(Ref ref, String word) =>
    ref.watch(bookmarkRepositoryProvider).watchIsBookmarked(word);


// RECENTS
@Riverpod(keepAlive: true)
class RecentsNotifier extends _$RecentsNotifier {
  @override
  Future<List<RecentSearchEntity>> build() =>
      ref.read(getRecentsUseCaseProvider).call();

  Future<void> remove(String word) async {
    await ref.read(recentRepositoryProvider).removeRecent(word);
    ref.invalidateSelf();
  }

  Future<void> clearAll() async {
    await ref.read(recentRepositoryProvider).clearAll();
    ref.invalidateSelf();
  }
}