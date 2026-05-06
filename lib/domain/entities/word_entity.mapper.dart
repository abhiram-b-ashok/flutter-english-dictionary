// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'word_entity.dart';

class WordSourceMapper extends EnumMapper<WordSource> {
  WordSourceMapper._();

  static WordSourceMapper? _instance;
  static WordSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WordSourceMapper._());
    }
    return _instance!;
  }

  static WordSource fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WordSource decode(dynamic value) {
    switch (value) {
      case r'remote':
        return WordSource.remote;
      case r'cache':
        return WordSource.cache;
      case r'bundled':
        return WordSource.bundled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WordSource self) {
    switch (self) {
      case WordSource.remote:
        return r'remote';
      case WordSource.cache:
        return r'cache';
      case WordSource.bundled:
        return r'bundled';
    }
  }
}

extension WordSourceMapperExtension on WordSource {
  String toValue() {
    WordSourceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WordSource>(this) as String;
  }
}

class WordEntityMapper extends ClassMapperBase<WordEntity> {
  WordEntityMapper._();

  static WordEntityMapper? _instance;
  static WordEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WordEntityMapper._());
      PhoneticEntityMapper.ensureInitialized();
      MeaningEntityMapper.ensureInitialized();
      WordSourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WordEntity';

  static String _$word(WordEntity v) => v.word;
  static const Field<WordEntity, String> _f$word = Field('word', _$word);
  static String? _$phonetic(WordEntity v) => v.phonetic;
  static const Field<WordEntity, String> _f$phonetic = Field(
    'phonetic',
    _$phonetic,
    opt: true,
  );
  static List<PhoneticEntity> _$phonetics(WordEntity v) => v.phonetics;
  static const Field<WordEntity, List<PhoneticEntity>> _f$phonetics = Field(
    'phonetics',
    _$phonetics,
  );
  static List<MeaningEntity> _$meanings(WordEntity v) => v.meanings;
  static const Field<WordEntity, List<MeaningEntity>> _f$meanings = Field(
    'meanings',
    _$meanings,
  );
  static WordSource _$source(WordEntity v) => v.source;
  static const Field<WordEntity, WordSource> _f$source = Field(
    'source',
    _$source,
  );

  @override
  final MappableFields<WordEntity> fields = const {
    #word: _f$word,
    #phonetic: _f$phonetic,
    #phonetics: _f$phonetics,
    #meanings: _f$meanings,
    #source: _f$source,
  };

  static WordEntity _instantiate(DecodingData data) {
    return WordEntity(
      word: data.dec(_f$word),
      phonetic: data.dec(_f$phonetic),
      phonetics: data.dec(_f$phonetics),
      meanings: data.dec(_f$meanings),
      source: data.dec(_f$source),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WordEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WordEntity>(map);
  }

  static WordEntity fromJson(String json) {
    return ensureInitialized().decodeJson<WordEntity>(json);
  }
}

mixin WordEntityMappable {
  String toJson() {
    return WordEntityMapper.ensureInitialized().encodeJson<WordEntity>(
      this as WordEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return WordEntityMapper.ensureInitialized().encodeMap<WordEntity>(
      this as WordEntity,
    );
  }

  WordEntityCopyWith<WordEntity, WordEntity, WordEntity> get copyWith =>
      _WordEntityCopyWithImpl<WordEntity, WordEntity>(
        this as WordEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WordEntityMapper.ensureInitialized().stringifyValue(
      this as WordEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return WordEntityMapper.ensureInitialized().equalsValue(
      this as WordEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return WordEntityMapper.ensureInitialized().hashValue(this as WordEntity);
  }
}

extension WordEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WordEntity, $Out> {
  WordEntityCopyWith<$R, WordEntity, $Out> get $asWordEntity =>
      $base.as((v, t, t2) => _WordEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WordEntityCopyWith<$R, $In extends WordEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    PhoneticEntity,
    PhoneticEntityCopyWith<$R, PhoneticEntity, PhoneticEntity>
  >
  get phonetics;
  ListCopyWith<
    $R,
    MeaningEntity,
    MeaningEntityCopyWith<$R, MeaningEntity, MeaningEntity>
  >
  get meanings;
  $R call({
    String? word,
    String? phonetic,
    List<PhoneticEntity>? phonetics,
    List<MeaningEntity>? meanings,
    WordSource? source,
  });
  WordEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WordEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WordEntity, $Out>
    implements WordEntityCopyWith<$R, WordEntity, $Out> {
  _WordEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WordEntity> $mapper =
      WordEntityMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    PhoneticEntity,
    PhoneticEntityCopyWith<$R, PhoneticEntity, PhoneticEntity>
  >
  get phonetics => ListCopyWith(
    $value.phonetics,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(phonetics: v),
  );
  @override
  ListCopyWith<
    $R,
    MeaningEntity,
    MeaningEntityCopyWith<$R, MeaningEntity, MeaningEntity>
  >
  get meanings => ListCopyWith(
    $value.meanings,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(meanings: v),
  );
  @override
  $R call({
    String? word,
    Object? phonetic = $none,
    List<PhoneticEntity>? phonetics,
    List<MeaningEntity>? meanings,
    WordSource? source,
  }) => $apply(
    FieldCopyWithData({
      if (word != null) #word: word,
      if (phonetic != $none) #phonetic: phonetic,
      if (phonetics != null) #phonetics: phonetics,
      if (meanings != null) #meanings: meanings,
      if (source != null) #source: source,
    }),
  );
  @override
  WordEntity $make(CopyWithData data) => WordEntity(
    word: data.get(#word, or: $value.word),
    phonetic: data.get(#phonetic, or: $value.phonetic),
    phonetics: data.get(#phonetics, or: $value.phonetics),
    meanings: data.get(#meanings, or: $value.meanings),
    source: data.get(#source, or: $value.source),
  );

  @override
  WordEntityCopyWith<$R2, WordEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WordEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PhoneticEntityMapper extends ClassMapperBase<PhoneticEntity> {
  PhoneticEntityMapper._();

  static PhoneticEntityMapper? _instance;
  static PhoneticEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhoneticEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PhoneticEntity';

  static String? _$text(PhoneticEntity v) => v.text;
  static const Field<PhoneticEntity, String> _f$text = Field(
    'text',
    _$text,
    opt: true,
  );
  static String? _$audioUrl(PhoneticEntity v) => v.audioUrl;
  static const Field<PhoneticEntity, String> _f$audioUrl = Field(
    'audioUrl',
    _$audioUrl,
    opt: true,
  );

  @override
  final MappableFields<PhoneticEntity> fields = const {
    #text: _f$text,
    #audioUrl: _f$audioUrl,
  };

  static PhoneticEntity _instantiate(DecodingData data) {
    return PhoneticEntity(
      text: data.dec(_f$text),
      audioUrl: data.dec(_f$audioUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PhoneticEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PhoneticEntity>(map);
  }

  static PhoneticEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PhoneticEntity>(json);
  }
}

mixin PhoneticEntityMappable {
  String toJson() {
    return PhoneticEntityMapper.ensureInitialized().encodeJson<PhoneticEntity>(
      this as PhoneticEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return PhoneticEntityMapper.ensureInitialized().encodeMap<PhoneticEntity>(
      this as PhoneticEntity,
    );
  }

  PhoneticEntityCopyWith<PhoneticEntity, PhoneticEntity, PhoneticEntity>
  get copyWith => _PhoneticEntityCopyWithImpl<PhoneticEntity, PhoneticEntity>(
    this as PhoneticEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PhoneticEntityMapper.ensureInitialized().stringifyValue(
      this as PhoneticEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return PhoneticEntityMapper.ensureInitialized().equalsValue(
      this as PhoneticEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return PhoneticEntityMapper.ensureInitialized().hashValue(
      this as PhoneticEntity,
    );
  }
}

extension PhoneticEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PhoneticEntity, $Out> {
  PhoneticEntityCopyWith<$R, PhoneticEntity, $Out> get $asPhoneticEntity =>
      $base.as((v, t, t2) => _PhoneticEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PhoneticEntityCopyWith<$R, $In extends PhoneticEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? text, String? audioUrl});
  PhoneticEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PhoneticEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PhoneticEntity, $Out>
    implements PhoneticEntityCopyWith<$R, PhoneticEntity, $Out> {
  _PhoneticEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PhoneticEntity> $mapper =
      PhoneticEntityMapper.ensureInitialized();
  @override
  $R call({Object? text = $none, Object? audioUrl = $none}) => $apply(
    FieldCopyWithData({
      if (text != $none) #text: text,
      if (audioUrl != $none) #audioUrl: audioUrl,
    }),
  );
  @override
  PhoneticEntity $make(CopyWithData data) => PhoneticEntity(
    text: data.get(#text, or: $value.text),
    audioUrl: data.get(#audioUrl, or: $value.audioUrl),
  );

  @override
  PhoneticEntityCopyWith<$R2, PhoneticEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PhoneticEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MeaningEntityMapper extends ClassMapperBase<MeaningEntity> {
  MeaningEntityMapper._();

  static MeaningEntityMapper? _instance;
  static MeaningEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MeaningEntityMapper._());
      DefinitionEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MeaningEntity';

  static String _$partOfSpeech(MeaningEntity v) => v.partOfSpeech;
  static const Field<MeaningEntity, String> _f$partOfSpeech = Field(
    'partOfSpeech',
    _$partOfSpeech,
  );
  static List<DefinitionEntity> _$definitions(MeaningEntity v) => v.definitions;
  static const Field<MeaningEntity, List<DefinitionEntity>> _f$definitions =
      Field('definitions', _$definitions);
  static List<String> _$synonyms(MeaningEntity v) => v.synonyms;
  static const Field<MeaningEntity, List<String>> _f$synonyms = Field(
    'synonyms',
    _$synonyms,
  );
  static List<String> _$antonyms(MeaningEntity v) => v.antonyms;
  static const Field<MeaningEntity, List<String>> _f$antonyms = Field(
    'antonyms',
    _$antonyms,
  );

  @override
  final MappableFields<MeaningEntity> fields = const {
    #partOfSpeech: _f$partOfSpeech,
    #definitions: _f$definitions,
    #synonyms: _f$synonyms,
    #antonyms: _f$antonyms,
  };

  static MeaningEntity _instantiate(DecodingData data) {
    return MeaningEntity(
      partOfSpeech: data.dec(_f$partOfSpeech),
      definitions: data.dec(_f$definitions),
      synonyms: data.dec(_f$synonyms),
      antonyms: data.dec(_f$antonyms),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MeaningEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MeaningEntity>(map);
  }

  static MeaningEntity fromJson(String json) {
    return ensureInitialized().decodeJson<MeaningEntity>(json);
  }
}

mixin MeaningEntityMappable {
  String toJson() {
    return MeaningEntityMapper.ensureInitialized().encodeJson<MeaningEntity>(
      this as MeaningEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return MeaningEntityMapper.ensureInitialized().encodeMap<MeaningEntity>(
      this as MeaningEntity,
    );
  }

  MeaningEntityCopyWith<MeaningEntity, MeaningEntity, MeaningEntity>
  get copyWith => _MeaningEntityCopyWithImpl<MeaningEntity, MeaningEntity>(
    this as MeaningEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return MeaningEntityMapper.ensureInitialized().stringifyValue(
      this as MeaningEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return MeaningEntityMapper.ensureInitialized().equalsValue(
      this as MeaningEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return MeaningEntityMapper.ensureInitialized().hashValue(
      this as MeaningEntity,
    );
  }
}

extension MeaningEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MeaningEntity, $Out> {
  MeaningEntityCopyWith<$R, MeaningEntity, $Out> get $asMeaningEntity =>
      $base.as((v, t, t2) => _MeaningEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MeaningEntityCopyWith<$R, $In extends MeaningEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    DefinitionEntity,
    DefinitionEntityCopyWith<$R, DefinitionEntity, DefinitionEntity>
  >
  get definitions;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get antonyms;
  $R call({
    String? partOfSpeech,
    List<DefinitionEntity>? definitions,
    List<String>? synonyms,
    List<String>? antonyms,
  });
  MeaningEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MeaningEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MeaningEntity, $Out>
    implements MeaningEntityCopyWith<$R, MeaningEntity, $Out> {
  _MeaningEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MeaningEntity> $mapper =
      MeaningEntityMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    DefinitionEntity,
    DefinitionEntityCopyWith<$R, DefinitionEntity, DefinitionEntity>
  >
  get definitions => ListCopyWith(
    $value.definitions,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(definitions: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms =>
      ListCopyWith(
        $value.synonyms,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(synonyms: v),
      );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get antonyms =>
      ListCopyWith(
        $value.antonyms,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(antonyms: v),
      );
  @override
  $R call({
    String? partOfSpeech,
    List<DefinitionEntity>? definitions,
    List<String>? synonyms,
    List<String>? antonyms,
  }) => $apply(
    FieldCopyWithData({
      if (partOfSpeech != null) #partOfSpeech: partOfSpeech,
      if (definitions != null) #definitions: definitions,
      if (synonyms != null) #synonyms: synonyms,
      if (antonyms != null) #antonyms: antonyms,
    }),
  );
  @override
  MeaningEntity $make(CopyWithData data) => MeaningEntity(
    partOfSpeech: data.get(#partOfSpeech, or: $value.partOfSpeech),
    definitions: data.get(#definitions, or: $value.definitions),
    synonyms: data.get(#synonyms, or: $value.synonyms),
    antonyms: data.get(#antonyms, or: $value.antonyms),
  );

  @override
  MeaningEntityCopyWith<$R2, MeaningEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MeaningEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DefinitionEntityMapper extends ClassMapperBase<DefinitionEntity> {
  DefinitionEntityMapper._();

  static DefinitionEntityMapper? _instance;
  static DefinitionEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DefinitionEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DefinitionEntity';

  static String _$definition(DefinitionEntity v) => v.definition;
  static const Field<DefinitionEntity, String> _f$definition = Field(
    'definition',
    _$definition,
  );
  static String? _$example(DefinitionEntity v) => v.example;
  static const Field<DefinitionEntity, String> _f$example = Field(
    'example',
    _$example,
    opt: true,
  );
  static List<String> _$synonyms(DefinitionEntity v) => v.synonyms;
  static const Field<DefinitionEntity, List<String>> _f$synonyms = Field(
    'synonyms',
    _$synonyms,
  );
  static List<String> _$antonyms(DefinitionEntity v) => v.antonyms;
  static const Field<DefinitionEntity, List<String>> _f$antonyms = Field(
    'antonyms',
    _$antonyms,
  );

  @override
  final MappableFields<DefinitionEntity> fields = const {
    #definition: _f$definition,
    #example: _f$example,
    #synonyms: _f$synonyms,
    #antonyms: _f$antonyms,
  };

  static DefinitionEntity _instantiate(DecodingData data) {
    return DefinitionEntity(
      definition: data.dec(_f$definition),
      example: data.dec(_f$example),
      synonyms: data.dec(_f$synonyms),
      antonyms: data.dec(_f$antonyms),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DefinitionEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DefinitionEntity>(map);
  }

  static DefinitionEntity fromJson(String json) {
    return ensureInitialized().decodeJson<DefinitionEntity>(json);
  }
}

mixin DefinitionEntityMappable {
  String toJson() {
    return DefinitionEntityMapper.ensureInitialized()
        .encodeJson<DefinitionEntity>(this as DefinitionEntity);
  }

  Map<String, dynamic> toMap() {
    return DefinitionEntityMapper.ensureInitialized()
        .encodeMap<DefinitionEntity>(this as DefinitionEntity);
  }

  DefinitionEntityCopyWith<DefinitionEntity, DefinitionEntity, DefinitionEntity>
  get copyWith =>
      _DefinitionEntityCopyWithImpl<DefinitionEntity, DefinitionEntity>(
        this as DefinitionEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DefinitionEntityMapper.ensureInitialized().stringifyValue(
      this as DefinitionEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return DefinitionEntityMapper.ensureInitialized().equalsValue(
      this as DefinitionEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return DefinitionEntityMapper.ensureInitialized().hashValue(
      this as DefinitionEntity,
    );
  }
}

extension DefinitionEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DefinitionEntity, $Out> {
  DefinitionEntityCopyWith<$R, DefinitionEntity, $Out>
  get $asDefinitionEntity =>
      $base.as((v, t, t2) => _DefinitionEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DefinitionEntityCopyWith<$R, $In extends DefinitionEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get antonyms;
  $R call({
    String? definition,
    String? example,
    List<String>? synonyms,
    List<String>? antonyms,
  });
  DefinitionEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DefinitionEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DefinitionEntity, $Out>
    implements DefinitionEntityCopyWith<$R, DefinitionEntity, $Out> {
  _DefinitionEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DefinitionEntity> $mapper =
      DefinitionEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms =>
      ListCopyWith(
        $value.synonyms,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(synonyms: v),
      );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get antonyms =>
      ListCopyWith(
        $value.antonyms,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(antonyms: v),
      );
  @override
  $R call({
    String? definition,
    Object? example = $none,
    List<String>? synonyms,
    List<String>? antonyms,
  }) => $apply(
    FieldCopyWithData({
      if (definition != null) #definition: definition,
      if (example != $none) #example: example,
      if (synonyms != null) #synonyms: synonyms,
      if (antonyms != null) #antonyms: antonyms,
    }),
  );
  @override
  DefinitionEntity $make(CopyWithData data) => DefinitionEntity(
    definition: data.get(#definition, or: $value.definition),
    example: data.get(#example, or: $value.example),
    synonyms: data.get(#synonyms, or: $value.synonyms),
    antonyms: data.get(#antonyms, or: $value.antonyms),
  );

  @override
  DefinitionEntityCopyWith<$R2, DefinitionEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DefinitionEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

