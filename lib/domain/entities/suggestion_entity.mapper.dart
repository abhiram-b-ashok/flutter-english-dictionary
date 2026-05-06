// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'suggestion_entity.dart';

class SuggestionSourceMapper extends EnumMapper<SuggestionSource> {
  SuggestionSourceMapper._();

  static SuggestionSourceMapper? _instance;
  static SuggestionSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SuggestionSourceMapper._());
    }
    return _instance!;
  }

  static SuggestionSource fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SuggestionSource decode(dynamic value) {
    switch (value) {
      case r'bundled':
        return SuggestionSource.bundled;
      case r'cache':
        return SuggestionSource.cache;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SuggestionSource self) {
    switch (self) {
      case SuggestionSource.bundled:
        return r'bundled';
      case SuggestionSource.cache:
        return r'cache';
    }
  }
}

extension SuggestionSourceMapperExtension on SuggestionSource {
  String toValue() {
    SuggestionSourceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SuggestionSource>(this) as String;
  }
}

class SuggestionEntityMapper extends ClassMapperBase<SuggestionEntity> {
  SuggestionEntityMapper._();

  static SuggestionEntityMapper? _instance;
  static SuggestionEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SuggestionEntityMapper._());
      SuggestionSourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SuggestionEntity';

  static String _$word(SuggestionEntity v) => v.word;
  static const Field<SuggestionEntity, String> _f$word = Field('word', _$word);
  static SuggestionSource _$source(SuggestionEntity v) => v.source;
  static const Field<SuggestionEntity, SuggestionSource> _f$source = Field(
    'source',
    _$source,
  );

  @override
  final MappableFields<SuggestionEntity> fields = const {
    #word: _f$word,
    #source: _f$source,
  };

  static SuggestionEntity _instantiate(DecodingData data) {
    return SuggestionEntity(
      word: data.dec(_f$word),
      source: data.dec(_f$source),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SuggestionEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SuggestionEntity>(map);
  }

  static SuggestionEntity fromJson(String json) {
    return ensureInitialized().decodeJson<SuggestionEntity>(json);
  }
}

mixin SuggestionEntityMappable {
  String toJson() {
    return SuggestionEntityMapper.ensureInitialized()
        .encodeJson<SuggestionEntity>(this as SuggestionEntity);
  }

  Map<String, dynamic> toMap() {
    return SuggestionEntityMapper.ensureInitialized()
        .encodeMap<SuggestionEntity>(this as SuggestionEntity);
  }

  SuggestionEntityCopyWith<SuggestionEntity, SuggestionEntity, SuggestionEntity>
  get copyWith =>
      _SuggestionEntityCopyWithImpl<SuggestionEntity, SuggestionEntity>(
        this as SuggestionEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SuggestionEntityMapper.ensureInitialized().stringifyValue(
      this as SuggestionEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SuggestionEntityMapper.ensureInitialized().equalsValue(
      this as SuggestionEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SuggestionEntityMapper.ensureInitialized().hashValue(
      this as SuggestionEntity,
    );
  }
}

extension SuggestionEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SuggestionEntity, $Out> {
  SuggestionEntityCopyWith<$R, SuggestionEntity, $Out>
  get $asSuggestionEntity =>
      $base.as((v, t, t2) => _SuggestionEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SuggestionEntityCopyWith<$R, $In extends SuggestionEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? word, SuggestionSource? source});
  SuggestionEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SuggestionEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SuggestionEntity, $Out>
    implements SuggestionEntityCopyWith<$R, SuggestionEntity, $Out> {
  _SuggestionEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SuggestionEntity> $mapper =
      SuggestionEntityMapper.ensureInitialized();
  @override
  $R call({String? word, SuggestionSource? source}) => $apply(
    FieldCopyWithData({
      if (word != null) #word: word,
      if (source != null) #source: source,
    }),
  );
  @override
  SuggestionEntity $make(CopyWithData data) => SuggestionEntity(
    word: data.get(#word, or: $value.word),
    source: data.get(#source, or: $value.source),
  );

  @override
  SuggestionEntityCopyWith<$R2, SuggestionEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SuggestionEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

