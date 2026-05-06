// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bookmark_entity.dart';

class BookmarkEntityMapper extends ClassMapperBase<BookmarkEntity> {
  BookmarkEntityMapper._();

  static BookmarkEntityMapper? _instance;
  static BookmarkEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookmarkEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BookmarkEntity';

  static String _$word(BookmarkEntity v) => v.word;
  static const Field<BookmarkEntity, String> _f$word = Field('word', _$word);
  static DateTime _$savedAt(BookmarkEntity v) => v.savedAt;
  static const Field<BookmarkEntity, DateTime> _f$savedAt = Field(
    'savedAt',
    _$savedAt,
  );

  @override
  final MappableFields<BookmarkEntity> fields = const {
    #word: _f$word,
    #savedAt: _f$savedAt,
  };

  static BookmarkEntity _instantiate(DecodingData data) {
    return BookmarkEntity(
      word: data.dec(_f$word),
      savedAt: data.dec(_f$savedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BookmarkEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BookmarkEntity>(map);
  }

  static BookmarkEntity fromJson(String json) {
    return ensureInitialized().decodeJson<BookmarkEntity>(json);
  }
}

mixin BookmarkEntityMappable {
  String toJson() {
    return BookmarkEntityMapper.ensureInitialized().encodeJson<BookmarkEntity>(
      this as BookmarkEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return BookmarkEntityMapper.ensureInitialized().encodeMap<BookmarkEntity>(
      this as BookmarkEntity,
    );
  }

  BookmarkEntityCopyWith<BookmarkEntity, BookmarkEntity, BookmarkEntity>
  get copyWith => _BookmarkEntityCopyWithImpl<BookmarkEntity, BookmarkEntity>(
    this as BookmarkEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BookmarkEntityMapper.ensureInitialized().stringifyValue(
      this as BookmarkEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return BookmarkEntityMapper.ensureInitialized().equalsValue(
      this as BookmarkEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return BookmarkEntityMapper.ensureInitialized().hashValue(
      this as BookmarkEntity,
    );
  }
}

extension BookmarkEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BookmarkEntity, $Out> {
  BookmarkEntityCopyWith<$R, BookmarkEntity, $Out> get $asBookmarkEntity =>
      $base.as((v, t, t2) => _BookmarkEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BookmarkEntityCopyWith<$R, $In extends BookmarkEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? word, DateTime? savedAt});
  BookmarkEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BookmarkEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BookmarkEntity, $Out>
    implements BookmarkEntityCopyWith<$R, BookmarkEntity, $Out> {
  _BookmarkEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BookmarkEntity> $mapper =
      BookmarkEntityMapper.ensureInitialized();
  @override
  $R call({String? word, DateTime? savedAt}) => $apply(
    FieldCopyWithData({
      if (word != null) #word: word,
      if (savedAt != null) #savedAt: savedAt,
    }),
  );
  @override
  BookmarkEntity $make(CopyWithData data) => BookmarkEntity(
    word: data.get(#word, or: $value.word),
    savedAt: data.get(#savedAt, or: $value.savedAt),
  );

  @override
  BookmarkEntityCopyWith<$R2, BookmarkEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BookmarkEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecentSearchEntityMapper extends ClassMapperBase<RecentSearchEntity> {
  RecentSearchEntityMapper._();

  static RecentSearchEntityMapper? _instance;
  static RecentSearchEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecentSearchEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RecentSearchEntity';

  static String _$word(RecentSearchEntity v) => v.word;
  static const Field<RecentSearchEntity, String> _f$word = Field(
    'word',
    _$word,
  );
  static DateTime _$searchedAt(RecentSearchEntity v) => v.searchedAt;
  static const Field<RecentSearchEntity, DateTime> _f$searchedAt = Field(
    'searchedAt',
    _$searchedAt,
  );

  @override
  final MappableFields<RecentSearchEntity> fields = const {
    #word: _f$word,
    #searchedAt: _f$searchedAt,
  };

  static RecentSearchEntity _instantiate(DecodingData data) {
    return RecentSearchEntity(
      word: data.dec(_f$word),
      searchedAt: data.dec(_f$searchedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RecentSearchEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecentSearchEntity>(map);
  }

  static RecentSearchEntity fromJson(String json) {
    return ensureInitialized().decodeJson<RecentSearchEntity>(json);
  }
}

mixin RecentSearchEntityMappable {
  String toJson() {
    return RecentSearchEntityMapper.ensureInitialized()
        .encodeJson<RecentSearchEntity>(this as RecentSearchEntity);
  }

  Map<String, dynamic> toMap() {
    return RecentSearchEntityMapper.ensureInitialized()
        .encodeMap<RecentSearchEntity>(this as RecentSearchEntity);
  }

  RecentSearchEntityCopyWith<
    RecentSearchEntity,
    RecentSearchEntity,
    RecentSearchEntity
  >
  get copyWith =>
      _RecentSearchEntityCopyWithImpl<RecentSearchEntity, RecentSearchEntity>(
        this as RecentSearchEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecentSearchEntityMapper.ensureInitialized().stringifyValue(
      this as RecentSearchEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return RecentSearchEntityMapper.ensureInitialized().equalsValue(
      this as RecentSearchEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return RecentSearchEntityMapper.ensureInitialized().hashValue(
      this as RecentSearchEntity,
    );
  }
}

extension RecentSearchEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RecentSearchEntity, $Out> {
  RecentSearchEntityCopyWith<$R, RecentSearchEntity, $Out>
  get $asRecentSearchEntity => $base.as(
    (v, t, t2) => _RecentSearchEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RecentSearchEntityCopyWith<
  $R,
  $In extends RecentSearchEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? word, DateTime? searchedAt});
  RecentSearchEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RecentSearchEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecentSearchEntity, $Out>
    implements RecentSearchEntityCopyWith<$R, RecentSearchEntity, $Out> {
  _RecentSearchEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecentSearchEntity> $mapper =
      RecentSearchEntityMapper.ensureInitialized();
  @override
  $R call({String? word, DateTime? searchedAt}) => $apply(
    FieldCopyWithData({
      if (word != null) #word: word,
      if (searchedAt != null) #searchedAt: searchedAt,
    }),
  );
  @override
  RecentSearchEntity $make(CopyWithData data) => RecentSearchEntity(
    word: data.get(#word, or: $value.word),
    searchedAt: data.get(#searchedAt, or: $value.searchedAt),
  );

  @override
  RecentSearchEntityCopyWith<$R2, RecentSearchEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RecentSearchEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

