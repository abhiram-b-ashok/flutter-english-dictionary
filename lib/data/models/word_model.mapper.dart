// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'word_model.dart';

class WordModelMapper extends ClassMapperBase<WordModel> {
  WordModelMapper._();

  static WordModelMapper? _instance;
  static WordModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WordModelMapper._());
      PhoneticModelMapper.ensureInitialized();
      MeaningModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WordModel';

  static String _$word(WordModel v) => v.word;
  static const Field<WordModel, String> _f$word = Field('word', _$word);
  static String? _$phonetic(WordModel v) => v.phonetic;
  static const Field<WordModel, String> _f$phonetic = Field(
    'phonetic',
    _$phonetic,
    opt: true,
  );
  static List<PhoneticModel> _$phonetics(WordModel v) => v.phonetics;
  static const Field<WordModel, List<PhoneticModel>> _f$phonetics = Field(
    'phonetics',
    _$phonetics,
    opt: true,
    def: const [],
  );
  static List<MeaningModel> _$meanings(WordModel v) => v.meanings;
  static const Field<WordModel, List<MeaningModel>> _f$meanings = Field(
    'meanings',
    _$meanings,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<WordModel> fields = const {
    #word: _f$word,
    #phonetic: _f$phonetic,
    #phonetics: _f$phonetics,
    #meanings: _f$meanings,
  };

  static WordModel _instantiate(DecodingData data) {
    return WordModel(
      word: data.dec(_f$word),
      phonetic: data.dec(_f$phonetic),
      phonetics: data.dec(_f$phonetics),
      meanings: data.dec(_f$meanings),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WordModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WordModel>(map);
  }

  static WordModel fromJson(String json) {
    return ensureInitialized().decodeJson<WordModel>(json);
  }
}

mixin WordModelMappable {
  String toJson() {
    return WordModelMapper.ensureInitialized().encodeJson<WordModel>(
      this as WordModel,
    );
  }

  Map<String, dynamic> toMap() {
    return WordModelMapper.ensureInitialized().encodeMap<WordModel>(
      this as WordModel,
    );
  }

  WordModelCopyWith<WordModel, WordModel, WordModel> get copyWith =>
      _WordModelCopyWithImpl<WordModel, WordModel>(
        this as WordModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WordModelMapper.ensureInitialized().stringifyValue(
      this as WordModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return WordModelMapper.ensureInitialized().equalsValue(
      this as WordModel,
      other,
    );
  }

  @override
  int get hashCode {
    return WordModelMapper.ensureInitialized().hashValue(this as WordModel);
  }
}

extension WordModelValueCopy<$R, $Out> on ObjectCopyWith<$R, WordModel, $Out> {
  WordModelCopyWith<$R, WordModel, $Out> get $asWordModel =>
      $base.as((v, t, t2) => _WordModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WordModelCopyWith<$R, $In extends WordModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    PhoneticModel,
    PhoneticModelCopyWith<$R, PhoneticModel, PhoneticModel>
  >
  get phonetics;
  ListCopyWith<
    $R,
    MeaningModel,
    MeaningModelCopyWith<$R, MeaningModel, MeaningModel>
  >
  get meanings;
  $R call({
    String? word,
    String? phonetic,
    List<PhoneticModel>? phonetics,
    List<MeaningModel>? meanings,
  });
  WordModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WordModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WordModel, $Out>
    implements WordModelCopyWith<$R, WordModel, $Out> {
  _WordModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WordModel> $mapper =
      WordModelMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    PhoneticModel,
    PhoneticModelCopyWith<$R, PhoneticModel, PhoneticModel>
  >
  get phonetics => ListCopyWith(
    $value.phonetics,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(phonetics: v),
  );
  @override
  ListCopyWith<
    $R,
    MeaningModel,
    MeaningModelCopyWith<$R, MeaningModel, MeaningModel>
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
    List<PhoneticModel>? phonetics,
    List<MeaningModel>? meanings,
  }) => $apply(
    FieldCopyWithData({
      if (word != null) #word: word,
      if (phonetic != $none) #phonetic: phonetic,
      if (phonetics != null) #phonetics: phonetics,
      if (meanings != null) #meanings: meanings,
    }),
  );
  @override
  WordModel $make(CopyWithData data) => WordModel(
    word: data.get(#word, or: $value.word),
    phonetic: data.get(#phonetic, or: $value.phonetic),
    phonetics: data.get(#phonetics, or: $value.phonetics),
    meanings: data.get(#meanings, or: $value.meanings),
  );

  @override
  WordModelCopyWith<$R2, WordModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WordModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PhoneticModelMapper extends ClassMapperBase<PhoneticModel> {
  PhoneticModelMapper._();

  static PhoneticModelMapper? _instance;
  static PhoneticModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhoneticModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PhoneticModel';

  static String? _$text(PhoneticModel v) => v.text;
  static const Field<PhoneticModel, String> _f$text = Field(
    'text',
    _$text,
    opt: true,
  );
  static String? _$audioUrl(PhoneticModel v) => v.audioUrl;
  static const Field<PhoneticModel, String> _f$audioUrl = Field(
    'audioUrl',
    _$audioUrl,
    key: r'audio',
    opt: true,
  );

  @override
  final MappableFields<PhoneticModel> fields = const {
    #text: _f$text,
    #audioUrl: _f$audioUrl,
  };

  static PhoneticModel _instantiate(DecodingData data) {
    return PhoneticModel(
      text: data.dec(_f$text),
      audioUrl: data.dec(_f$audioUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PhoneticModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PhoneticModel>(map);
  }

  static PhoneticModel fromJson(String json) {
    return ensureInitialized().decodeJson<PhoneticModel>(json);
  }
}

mixin PhoneticModelMappable {
  String toJson() {
    return PhoneticModelMapper.ensureInitialized().encodeJson<PhoneticModel>(
      this as PhoneticModel,
    );
  }

  Map<String, dynamic> toMap() {
    return PhoneticModelMapper.ensureInitialized().encodeMap<PhoneticModel>(
      this as PhoneticModel,
    );
  }

  PhoneticModelCopyWith<PhoneticModel, PhoneticModel, PhoneticModel>
  get copyWith => _PhoneticModelCopyWithImpl<PhoneticModel, PhoneticModel>(
    this as PhoneticModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PhoneticModelMapper.ensureInitialized().stringifyValue(
      this as PhoneticModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return PhoneticModelMapper.ensureInitialized().equalsValue(
      this as PhoneticModel,
      other,
    );
  }

  @override
  int get hashCode {
    return PhoneticModelMapper.ensureInitialized().hashValue(
      this as PhoneticModel,
    );
  }
}

extension PhoneticModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PhoneticModel, $Out> {
  PhoneticModelCopyWith<$R, PhoneticModel, $Out> get $asPhoneticModel =>
      $base.as((v, t, t2) => _PhoneticModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PhoneticModelCopyWith<$R, $In extends PhoneticModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? text, String? audioUrl});
  PhoneticModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PhoneticModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PhoneticModel, $Out>
    implements PhoneticModelCopyWith<$R, PhoneticModel, $Out> {
  _PhoneticModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PhoneticModel> $mapper =
      PhoneticModelMapper.ensureInitialized();
  @override
  $R call({Object? text = $none, Object? audioUrl = $none}) => $apply(
    FieldCopyWithData({
      if (text != $none) #text: text,
      if (audioUrl != $none) #audioUrl: audioUrl,
    }),
  );
  @override
  PhoneticModel $make(CopyWithData data) => PhoneticModel(
    text: data.get(#text, or: $value.text),
    audioUrl: data.get(#audioUrl, or: $value.audioUrl),
  );

  @override
  PhoneticModelCopyWith<$R2, PhoneticModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PhoneticModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MeaningModelMapper extends ClassMapperBase<MeaningModel> {
  MeaningModelMapper._();

  static MeaningModelMapper? _instance;
  static MeaningModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MeaningModelMapper._());
      DefinitionModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MeaningModel';

  static String _$partOfSpeech(MeaningModel v) => v.partOfSpeech;
  static const Field<MeaningModel, String> _f$partOfSpeech = Field(
    'partOfSpeech',
    _$partOfSpeech,
  );
  static List<DefinitionModel> _$definitions(MeaningModel v) => v.definitions;
  static const Field<MeaningModel, List<DefinitionModel>> _f$definitions =
      Field('definitions', _$definitions);
  static List<String> _$synonyms(MeaningModel v) => v.synonyms;
  static const Field<MeaningModel, List<String>> _f$synonyms = Field(
    'synonyms',
    _$synonyms,
    opt: true,
    def: const [],
  );
  static List<String> _$antonyms(MeaningModel v) => v.antonyms;
  static const Field<MeaningModel, List<String>> _f$antonyms = Field(
    'antonyms',
    _$antonyms,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<MeaningModel> fields = const {
    #partOfSpeech: _f$partOfSpeech,
    #definitions: _f$definitions,
    #synonyms: _f$synonyms,
    #antonyms: _f$antonyms,
  };

  static MeaningModel _instantiate(DecodingData data) {
    return MeaningModel(
      partOfSpeech: data.dec(_f$partOfSpeech),
      definitions: data.dec(_f$definitions),
      synonyms: data.dec(_f$synonyms),
      antonyms: data.dec(_f$antonyms),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MeaningModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MeaningModel>(map);
  }

  static MeaningModel fromJson(String json) {
    return ensureInitialized().decodeJson<MeaningModel>(json);
  }
}

mixin MeaningModelMappable {
  String toJson() {
    return MeaningModelMapper.ensureInitialized().encodeJson<MeaningModel>(
      this as MeaningModel,
    );
  }

  Map<String, dynamic> toMap() {
    return MeaningModelMapper.ensureInitialized().encodeMap<MeaningModel>(
      this as MeaningModel,
    );
  }

  MeaningModelCopyWith<MeaningModel, MeaningModel, MeaningModel> get copyWith =>
      _MeaningModelCopyWithImpl<MeaningModel, MeaningModel>(
        this as MeaningModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MeaningModelMapper.ensureInitialized().stringifyValue(
      this as MeaningModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MeaningModelMapper.ensureInitialized().equalsValue(
      this as MeaningModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MeaningModelMapper.ensureInitialized().hashValue(
      this as MeaningModel,
    );
  }
}

extension MeaningModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MeaningModel, $Out> {
  MeaningModelCopyWith<$R, MeaningModel, $Out> get $asMeaningModel =>
      $base.as((v, t, t2) => _MeaningModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MeaningModelCopyWith<$R, $In extends MeaningModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    DefinitionModel,
    DefinitionModelCopyWith<$R, DefinitionModel, DefinitionModel>
  >
  get definitions;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get antonyms;
  $R call({
    String? partOfSpeech,
    List<DefinitionModel>? definitions,
    List<String>? synonyms,
    List<String>? antonyms,
  });
  MeaningModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MeaningModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MeaningModel, $Out>
    implements MeaningModelCopyWith<$R, MeaningModel, $Out> {
  _MeaningModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MeaningModel> $mapper =
      MeaningModelMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    DefinitionModel,
    DefinitionModelCopyWith<$R, DefinitionModel, DefinitionModel>
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
    List<DefinitionModel>? definitions,
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
  MeaningModel $make(CopyWithData data) => MeaningModel(
    partOfSpeech: data.get(#partOfSpeech, or: $value.partOfSpeech),
    definitions: data.get(#definitions, or: $value.definitions),
    synonyms: data.get(#synonyms, or: $value.synonyms),
    antonyms: data.get(#antonyms, or: $value.antonyms),
  );

  @override
  MeaningModelCopyWith<$R2, MeaningModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MeaningModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DefinitionModelMapper extends ClassMapperBase<DefinitionModel> {
  DefinitionModelMapper._();

  static DefinitionModelMapper? _instance;
  static DefinitionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DefinitionModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DefinitionModel';

  static String _$definition(DefinitionModel v) => v.definition;
  static const Field<DefinitionModel, String> _f$definition = Field(
    'definition',
    _$definition,
  );
  static String? _$example(DefinitionModel v) => v.example;
  static const Field<DefinitionModel, String> _f$example = Field(
    'example',
    _$example,
    opt: true,
  );
  static List<String> _$synonyms(DefinitionModel v) => v.synonyms;
  static const Field<DefinitionModel, List<String>> _f$synonyms = Field(
    'synonyms',
    _$synonyms,
    opt: true,
    def: const [],
  );
  static List<String> _$antonyms(DefinitionModel v) => v.antonyms;
  static const Field<DefinitionModel, List<String>> _f$antonyms = Field(
    'antonyms',
    _$antonyms,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<DefinitionModel> fields = const {
    #definition: _f$definition,
    #example: _f$example,
    #synonyms: _f$synonyms,
    #antonyms: _f$antonyms,
  };

  static DefinitionModel _instantiate(DecodingData data) {
    return DefinitionModel(
      definition: data.dec(_f$definition),
      example: data.dec(_f$example),
      synonyms: data.dec(_f$synonyms),
      antonyms: data.dec(_f$antonyms),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DefinitionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DefinitionModel>(map);
  }

  static DefinitionModel fromJson(String json) {
    return ensureInitialized().decodeJson<DefinitionModel>(json);
  }
}

mixin DefinitionModelMappable {
  String toJson() {
    return DefinitionModelMapper.ensureInitialized()
        .encodeJson<DefinitionModel>(this as DefinitionModel);
  }

  Map<String, dynamic> toMap() {
    return DefinitionModelMapper.ensureInitialized().encodeMap<DefinitionModel>(
      this as DefinitionModel,
    );
  }

  DefinitionModelCopyWith<DefinitionModel, DefinitionModel, DefinitionModel>
  get copyWith =>
      _DefinitionModelCopyWithImpl<DefinitionModel, DefinitionModel>(
        this as DefinitionModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DefinitionModelMapper.ensureInitialized().stringifyValue(
      this as DefinitionModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return DefinitionModelMapper.ensureInitialized().equalsValue(
      this as DefinitionModel,
      other,
    );
  }

  @override
  int get hashCode {
    return DefinitionModelMapper.ensureInitialized().hashValue(
      this as DefinitionModel,
    );
  }
}

extension DefinitionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DefinitionModel, $Out> {
  DefinitionModelCopyWith<$R, DefinitionModel, $Out> get $asDefinitionModel =>
      $base.as((v, t, t2) => _DefinitionModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DefinitionModelCopyWith<$R, $In extends DefinitionModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get synonyms;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get antonyms;
  $R call({
    String? definition,
    String? example,
    List<String>? synonyms,
    List<String>? antonyms,
  });
  DefinitionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DefinitionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DefinitionModel, $Out>
    implements DefinitionModelCopyWith<$R, DefinitionModel, $Out> {
  _DefinitionModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DefinitionModel> $mapper =
      DefinitionModelMapper.ensureInitialized();
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
  DefinitionModel $make(CopyWithData data) => DefinitionModel(
    definition: data.get(#definition, or: $value.definition),
    example: data.get(#example, or: $value.example),
    synonyms: data.get(#synonyms, or: $value.synonyms),
    antonyms: data.get(#antonyms, or: $value.antonyms),
  );

  @override
  DefinitionModelCopyWith<$R2, DefinitionModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DefinitionModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ApiErrorModelMapper extends ClassMapperBase<ApiErrorModel> {
  ApiErrorModelMapper._();

  static ApiErrorModelMapper? _instance;
  static ApiErrorModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiErrorModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApiErrorModel';

  static String _$title(ApiErrorModel v) => v.title;
  static const Field<ApiErrorModel, String> _f$title = Field('title', _$title);
  static String _$message(ApiErrorModel v) => v.message;
  static const Field<ApiErrorModel, String> _f$message = Field(
    'message',
    _$message,
  );
  static String _$resolution(ApiErrorModel v) => v.resolution;
  static const Field<ApiErrorModel, String> _f$resolution = Field(
    'resolution',
    _$resolution,
  );

  @override
  final MappableFields<ApiErrorModel> fields = const {
    #title: _f$title,
    #message: _f$message,
    #resolution: _f$resolution,
  };

  static ApiErrorModel _instantiate(DecodingData data) {
    return ApiErrorModel(
      title: data.dec(_f$title),
      message: data.dec(_f$message),
      resolution: data.dec(_f$resolution),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApiErrorModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiErrorModel>(map);
  }

  static ApiErrorModel fromJson(String json) {
    return ensureInitialized().decodeJson<ApiErrorModel>(json);
  }
}

mixin ApiErrorModelMappable {
  String toJson() {
    return ApiErrorModelMapper.ensureInitialized().encodeJson<ApiErrorModel>(
      this as ApiErrorModel,
    );
  }

  Map<String, dynamic> toMap() {
    return ApiErrorModelMapper.ensureInitialized().encodeMap<ApiErrorModel>(
      this as ApiErrorModel,
    );
  }

  ApiErrorModelCopyWith<ApiErrorModel, ApiErrorModel, ApiErrorModel>
  get copyWith => _ApiErrorModelCopyWithImpl<ApiErrorModel, ApiErrorModel>(
    this as ApiErrorModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ApiErrorModelMapper.ensureInitialized().stringifyValue(
      this as ApiErrorModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApiErrorModelMapper.ensureInitialized().equalsValue(
      this as ApiErrorModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ApiErrorModelMapper.ensureInitialized().hashValue(
      this as ApiErrorModel,
    );
  }
}

extension ApiErrorModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApiErrorModel, $Out> {
  ApiErrorModelCopyWith<$R, ApiErrorModel, $Out> get $asApiErrorModel =>
      $base.as((v, t, t2) => _ApiErrorModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApiErrorModelCopyWith<$R, $In extends ApiErrorModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, String? message, String? resolution});
  ApiErrorModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApiErrorModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiErrorModel, $Out>
    implements ApiErrorModelCopyWith<$R, ApiErrorModel, $Out> {
  _ApiErrorModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiErrorModel> $mapper =
      ApiErrorModelMapper.ensureInitialized();
  @override
  $R call({String? title, String? message, String? resolution}) => $apply(
    FieldCopyWithData({
      if (title != null) #title: title,
      if (message != null) #message: message,
      if (resolution != null) #resolution: resolution,
    }),
  );
  @override
  ApiErrorModel $make(CopyWithData data) => ApiErrorModel(
    title: data.get(#title, or: $value.title),
    message: data.get(#message, or: $value.message),
    resolution: data.get(#resolution, or: $value.resolution),
  );

  @override
  ApiErrorModelCopyWith<$R2, ApiErrorModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApiErrorModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

