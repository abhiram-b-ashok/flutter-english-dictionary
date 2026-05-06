
import 'package:dart_mappable/dart_mappable.dart';

part '../entities/word_entity.mapper.dart';

@MappableClass()
class WordEntity with WordEntityMappable {
 
  final String word;
  final String? phonetic;
  final List<PhoneticEntity> phonetics;
  final List<MeaningEntity> meanings;
  final WordSource source;

  const WordEntity({
    required this.word,
    this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.source,
  });
}

@MappableEnum()
enum WordSource {
  remote,
  cache,
  bundled,
}

//Phonetic 
@MappableClass()
class PhoneticEntity with PhoneticEntityMappable {

  final String? text;
  final String? audioUrl;

  const PhoneticEntity({
    this.text,
    this.audioUrl,
  });
  
  bool get hasAudio => audioUrl != null && audioUrl!.isNotEmpty;
}

//Meaning 
@MappableClass()
class MeaningEntity with MeaningEntityMappable {

  final String partOfSpeech;
  final List<DefinitionEntity> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  const MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });
}

//Definition 
@MappableClass()
class DefinitionEntity with DefinitionEntityMappable {

  final String definition;
  final String? example;
  final List<String> synonyms;
  final List<String> antonyms;

  const DefinitionEntity({
    required this.definition,
    this.example,
    required this.synonyms,
    required this.antonyms,
  });
}