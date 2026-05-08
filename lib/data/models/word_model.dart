
import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/word_entity.dart';

part 'word_model.mapper.dart';

@MappableClass()
class WordModel with WordModelMappable {
  final String word;
  final String? phonetic;
  final List<PhoneticModel> phonetics;
  final List<MeaningModel> meanings;

  const WordModel({
    required this.word,
    this.phonetic,
    this.phonetics = const [],
    this.meanings = const [],
  });
}

@MappableClass()
class PhoneticModel with PhoneticModelMappable {
  final String? text;

  @MappableField(key: 'audio')
  final String? audioUrl;

  const PhoneticModel({this.text, this.audioUrl});

  PhoneticEntity toEntity() => PhoneticEntity(
        text: text,
        audioUrl: (audioUrl?.isNotEmpty == true) ? audioUrl : null,
      );
}

@MappableClass()
class MeaningModel with MeaningModelMappable {
  final String partOfSpeech;
  final List<DefinitionModel> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  const MeaningModel({
    required this.partOfSpeech,
    required this.definitions,
    this.synonyms = const [],
    this.antonyms = const [],
  });

  MeaningEntity toEntity() => MeaningEntity(
        partOfSpeech: partOfSpeech,
        definitions: definitions.map((d) => d.toEntity()).toList(),
        synonyms: synonyms,
        antonyms: antonyms,
      );
}

@MappableClass()
class DefinitionModel with DefinitionModelMappable {
  final String definition;
  final String? example;
  final List<String> synonyms;
  final List<String> antonyms;

  const DefinitionModel({
    required this.definition,
    this.example,
    this.synonyms = const [],
    this.antonyms = const [],
  });

  DefinitionEntity toEntity() => DefinitionEntity(
        definition: definition,
        example: example,
        synonyms: synonyms,
        antonyms: antonyms,
      );
}

@MappableClass()
class ApiErrorModel with ApiErrorModelMappable {
  final String title;
  final String message;
  final String resolution;

  const ApiErrorModel({
    required this.title,
    required this.message,
    required this.resolution,
  });

  bool get isNotFound => title == 'No Definitions Found';
}

WordEntity mergeWordModels(List<WordModel> models, WordSource source) {
  assert(models.isNotEmpty, 'Cannot merge an empty list of WordModels');

  final first = models.first;

  final allMeanings = models
      .expand((m) => m.meanings)
      .map((m) => m.toEntity())
      .toList();

  final seenAudioUrls = <String>{};
  final phonetics = models
      .expand((m) => m.phonetics)
      .map((p) => p.toEntity())
      .where((p) {
        if (p.audioUrl == null) return p.text != null;
        return seenAudioUrls.add(p.audioUrl!);
      })
      .toList();

  return WordEntity(
    word: first.word,
    phonetic: first.phonetic,
    phonetics: phonetics,
    meanings: allMeanings,
    source: source,
  );
}