// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sembastStore)
const sembastStoreProvider = SembastStoreProvider._();

final class SembastStoreProvider
    extends
        $FunctionalProvider<SembastDatabase, SembastDatabase, SembastDatabase>
    with $Provider<SembastDatabase> {
  const SembastStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sembastStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sembastStoreHash();

  @$internal
  @override
  $ProviderElement<SembastDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SembastDatabase create(Ref ref) {
    return sembastStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SembastDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SembastDatabase>(value),
    );
  }
}

String _$sembastStoreHash() => r'a96c6bded1848f572f79a5f39aebdef955bd4ed3';

@ProviderFor(chopperService)
const chopperServiceProvider = ChopperServiceProvider._();

final class ChopperServiceProvider
    extends
        $FunctionalProvider<
          DictionaryChopperService,
          DictionaryChopperService,
          DictionaryChopperService
        >
    with $Provider<DictionaryChopperService> {
  const ChopperServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chopperServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chopperServiceHash();

  @$internal
  @override
  $ProviderElement<DictionaryChopperService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryChopperService create(Ref ref) {
    return chopperService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryChopperService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryChopperService>(value),
    );
  }
}

String _$chopperServiceHash() => r'c913a0aac613b6d2f2e673b9811ce95f54fa0c70';

@ProviderFor(networkChecker)
const networkCheckerProvider = NetworkCheckerProvider._();

final class NetworkCheckerProvider
    extends $FunctionalProvider<NetworkChecker, NetworkChecker, NetworkChecker>
    with $Provider<NetworkChecker> {
  const NetworkCheckerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkCheckerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkCheckerHash();

  @$internal
  @override
  $ProviderElement<NetworkChecker> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkChecker create(Ref ref) {
    return networkChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkChecker>(value),
    );
  }
}

String _$networkCheckerHash() => r'f967fa6fcbec7bc20bd77b9b7d2d2a2f812492b9';

@ProviderFor(remoteDataSource)
const remoteDataSourceProvider = RemoteDataSourceProvider._();

final class RemoteDataSourceProvider
    extends
        $FunctionalProvider<
          DictionaryRemoteDatasource,
          DictionaryRemoteDatasource,
          DictionaryRemoteDatasource
        >
    with $Provider<DictionaryRemoteDatasource> {
  const RemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<DictionaryRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryRemoteDatasource create(Ref ref) {
    return remoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryRemoteDatasource>(value),
    );
  }
}

String _$remoteDataSourceHash() => r'73d3c7eb80adebe307137a6f7d2736ac8eccc432';

@ProviderFor(dictionaryRepository)
const dictionaryRepositoryProvider = DictionaryRepositoryProvider._();

final class DictionaryRepositoryProvider
    extends
        $FunctionalProvider<
          DictionaryRepository,
          DictionaryRepository,
          DictionaryRepository
        >
    with $Provider<DictionaryRepository> {
  const DictionaryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dictionaryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dictionaryRepositoryHash();

  @$internal
  @override
  $ProviderElement<DictionaryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryRepository create(Ref ref) {
    return dictionaryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryRepository>(value),
    );
  }
}

String _$dictionaryRepositoryHash() =>
    r'6af38c01a9c35efb547cdcd71c14e0e8cd5c8aa0';

@ProviderFor(bookmarkRepository)
const bookmarkRepositoryProvider = BookmarkRepositoryProvider._();

final class BookmarkRepositoryProvider
    extends
        $FunctionalProvider<
          BookmarkRepository,
          BookmarkRepository,
          BookmarkRepository
        >
    with $Provider<BookmarkRepository> {
  const BookmarkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookmarkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookmarkRepository create(Ref ref) {
    return bookmarkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookmarkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookmarkRepository>(value),
    );
  }
}

String _$bookmarkRepositoryHash() =>
    r'8c8a8fbf3e8d4679fa9525ca520455f80a4be005';

@ProviderFor(recentRepository)
const recentRepositoryProvider = RecentRepositoryProvider._();

final class RecentRepositoryProvider
    extends
        $FunctionalProvider<
          RecentRepository,
          RecentRepository,
          RecentRepository
        >
    with $Provider<RecentRepository> {
  const RecentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecentRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecentRepository create(Ref ref) {
    return recentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecentRepository>(value),
    );
  }
}

String _$recentRepositoryHash() => r'f0146d79a80ae4f74e936d22fcfd5cdfae38b5b0';

@ProviderFor(getWordDetailUseCase)
const getWordDetailUseCaseProvider = GetWordDetailUseCaseProvider._();

final class GetWordDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetWordDetailUseCase,
          GetWordDetailUseCase,
          GetWordDetailUseCase
        >
    with $Provider<GetWordDetailUseCase> {
  const GetWordDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getWordDetailUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getWordDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetWordDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetWordDetailUseCase create(Ref ref) {
    return getWordDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetWordDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetWordDetailUseCase>(value),
    );
  }
}

String _$getWordDetailUseCaseHash() =>
    r'd134ba73cf4369e0a17f9b50bfc8539565ce3092';

@ProviderFor(searchSuggestionsUseCase)
const searchSuggestionsUseCaseProvider = SearchSuggestionsUseCaseProvider._();

final class SearchSuggestionsUseCaseProvider
    extends
        $FunctionalProvider<
          SearchSuggestionsUseCase,
          SearchSuggestionsUseCase,
          SearchSuggestionsUseCase
        >
    with $Provider<SearchSuggestionsUseCase> {
  const SearchSuggestionsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchSuggestionsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchSuggestionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchSuggestionsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchSuggestionsUseCase create(Ref ref) {
    return searchSuggestionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchSuggestionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchSuggestionsUseCase>(value),
    );
  }
}

String _$searchSuggestionsUseCaseHash() =>
    r'0d25f68244a44b3248756c7065d0add59880afce';

@ProviderFor(toggleBookmarkUseCase)
const toggleBookmarkUseCaseProvider = ToggleBookmarkUseCaseProvider._();

final class ToggleBookmarkUseCaseProvider
    extends
        $FunctionalProvider<
          ToggleBookmarkUseCase,
          ToggleBookmarkUseCase,
          ToggleBookmarkUseCase
        >
    with $Provider<ToggleBookmarkUseCase> {
  const ToggleBookmarkUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleBookmarkUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleBookmarkUseCaseHash();

  @$internal
  @override
  $ProviderElement<ToggleBookmarkUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleBookmarkUseCase create(Ref ref) {
    return toggleBookmarkUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleBookmarkUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleBookmarkUseCase>(value),
    );
  }
}

String _$toggleBookmarkUseCaseHash() =>
    r'7da77744c778989882af8449e213781dcbeb926a';

@ProviderFor(getBookmarksUseCase)
const getBookmarksUseCaseProvider = GetBookmarksUseCaseProvider._();

final class GetBookmarksUseCaseProvider
    extends
        $FunctionalProvider<
          GetBookmarksUseCase,
          GetBookmarksUseCase,
          GetBookmarksUseCase
        >
    with $Provider<GetBookmarksUseCase> {
  const GetBookmarksUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBookmarksUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBookmarksUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBookmarksUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBookmarksUseCase create(Ref ref) {
    return getBookmarksUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBookmarksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBookmarksUseCase>(value),
    );
  }
}

String _$getBookmarksUseCaseHash() =>
    r'3be1860fe052ec15045025f788177afb359931fc';

@ProviderFor(getRecentsUseCase)
const getRecentsUseCaseProvider = GetRecentsUseCaseProvider._();

final class GetRecentsUseCaseProvider
    extends
        $FunctionalProvider<
          GetRecentsUseCase,
          GetRecentsUseCase,
          GetRecentsUseCase
        >
    with $Provider<GetRecentsUseCase> {
  const GetRecentsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getRecentsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getRecentsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetRecentsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetRecentsUseCase create(Ref ref) {
    return getRecentsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetRecentsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetRecentsUseCase>(value),
    );
  }
}

String _$getRecentsUseCaseHash() => r'781454ed962ce0232c90ab41760e479428e8bbaf';

@ProviderFor(isOnline)
const isOnlineProvider = IsOnlineProvider._();

final class IsOnlineProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOnlineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOnlineHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isOnline(ref);
  }
}

String _$isOnlineHash() => r'df185fa944c35edbb2a61387718ee05b193bb485';

@ProviderFor(ThemeModeNotifier)
const themeModeProvider = ThemeModeNotifierProvider._();

final class ThemeModeNotifierProvider
    extends $NotifierProvider<ThemeModeNotifier, ThemeMode> {
  const ThemeModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeNotifierHash();

  @$internal
  @override
  ThemeModeNotifier create() => ThemeModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeNotifierHash() => r'20ad68c75ddd4066b15247314d20735e2fa7579d';

abstract class _$ThemeModeNotifier extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AudioPlayerNotifier)
const audioPlayerProvider = AudioPlayerNotifierProvider._();

final class AudioPlayerNotifierProvider
    extends $NotifierProvider<AudioPlayerNotifier, bool> {
  const AudioPlayerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerNotifierHash();

  @$internal
  @override
  AudioPlayerNotifier create() => AudioPlayerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$audioPlayerNotifierHash() =>
    r'e2c53f7204e1af9471e5068e3b8e71ead37016af';

abstract class _$AudioPlayerNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SearchNotifier)
const searchProvider = SearchNotifierProvider._();

final class SearchNotifierProvider
    extends $AsyncNotifierProvider<SearchNotifier, List<SuggestionEntity>> {
  const SearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchNotifierHash();

  @$internal
  @override
  SearchNotifier create() => SearchNotifier();
}

String _$searchNotifierHash() => r'6d984489f92e34768e5c7fb5df5c8063c38002d0';

abstract class _$SearchNotifier extends $AsyncNotifier<List<SuggestionEntity>> {
  FutureOr<List<SuggestionEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<SuggestionEntity>>, List<SuggestionEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SuggestionEntity>>,
                List<SuggestionEntity>
              >,
              AsyncValue<List<SuggestionEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SearchSubmitNotifier)
const searchSubmitProvider = SearchSubmitNotifierProvider._();

final class SearchSubmitNotifierProvider
    extends $NotifierProvider<SearchSubmitNotifier, SearchSubmitState> {
  const SearchSubmitNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchSubmitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchSubmitNotifierHash();

  @$internal
  @override
  SearchSubmitNotifier create() => SearchSubmitNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchSubmitState>(value),
    );
  }
}

String _$searchSubmitNotifierHash() =>
    r'84f7093e3558180a79b33e5d8a62d05b86e1a35d';

abstract class _$SearchSubmitNotifier extends $Notifier<SearchSubmitState> {
  SearchSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SearchSubmitState, SearchSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchSubmitState, SearchSubmitState>,
              SearchSubmitState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(WordDetail)
const wordDetailProvider = WordDetailFamily._();

final class WordDetailProvider
    extends $AsyncNotifierProvider<WordDetail, WordEntity> {
  const WordDetailProvider._({
    required WordDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'wordDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wordDetailHash();

  @override
  String toString() {
    return r'wordDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WordDetail create() => WordDetail();

  @override
  bool operator ==(Object other) {
    return other is WordDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wordDetailHash() => r'2a636d27561f3c7ff7e2c610dcf6b02aa29470bc';

final class WordDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          WordDetail,
          AsyncValue<WordEntity>,
          WordEntity,
          FutureOr<WordEntity>,
          String
        > {
  const WordDetailFamily._()
    : super(
        retry: null,
        name: r'wordDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WordDetailProvider call(String word) =>
      WordDetailProvider._(argument: word, from: this);

  @override
  String toString() => r'wordDetailProvider';
}

abstract class _$WordDetail extends $AsyncNotifier<WordEntity> {
  late final _$args = ref.$arg as String;
  String get word => _$args;

  FutureOr<WordEntity> build(String word);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<WordEntity>, WordEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WordEntity>, WordEntity>,
              AsyncValue<WordEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BookmarkNotifier)
const bookmarkProvider = BookmarkNotifierProvider._();

final class BookmarkNotifierProvider
    extends $AsyncNotifierProvider<BookmarkNotifier, List<BookmarkEntity>> {
  const BookmarkNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkNotifierHash();

  @$internal
  @override
  BookmarkNotifier create() => BookmarkNotifier();
}

String _$bookmarkNotifierHash() => r'c46e5fa966b4244baefb6d501939c00455f7ca76';

abstract class _$BookmarkNotifier extends $AsyncNotifier<List<BookmarkEntity>> {
  FutureOr<List<BookmarkEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<BookmarkEntity>>, List<BookmarkEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BookmarkEntity>>,
                List<BookmarkEntity>
              >,
              AsyncValue<List<BookmarkEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(isWordBookmarked)
const isWordBookmarkedProvider = IsWordBookmarkedFamily._();

final class IsWordBookmarkedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsWordBookmarkedProvider._({
    required IsWordBookmarkedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isWordBookmarkedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isWordBookmarkedHash();

  @override
  String toString() {
    return r'isWordBookmarkedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isWordBookmarked(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsWordBookmarkedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isWordBookmarkedHash() => r'd46b6de038c461b1afdccaca0277d61f28ded4e2';

final class IsWordBookmarkedFamily extends $Family
    with $FunctionalFamilyOverride<Stream<bool>, String> {
  const IsWordBookmarkedFamily._()
    : super(
        retry: null,
        name: r'isWordBookmarkedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsWordBookmarkedProvider call(String word) =>
      IsWordBookmarkedProvider._(argument: word, from: this);

  @override
  String toString() => r'isWordBookmarkedProvider';
}

@ProviderFor(RecentsNotifier)
const recentsProvider = RecentsNotifierProvider._();

final class RecentsNotifierProvider
    extends $AsyncNotifierProvider<RecentsNotifier, List<RecentSearchEntity>> {
  const RecentsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentsNotifierHash();

  @$internal
  @override
  RecentsNotifier create() => RecentsNotifier();
}

String _$recentsNotifierHash() => r'214df1860b06fbc33ee030582ff0eae49fa17992';

abstract class _$RecentsNotifier
    extends $AsyncNotifier<List<RecentSearchEntity>> {
  FutureOr<List<RecentSearchEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<RecentSearchEntity>>,
              List<RecentSearchEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RecentSearchEntity>>,
                List<RecentSearchEntity>
              >,
              AsyncValue<List<RecentSearchEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
