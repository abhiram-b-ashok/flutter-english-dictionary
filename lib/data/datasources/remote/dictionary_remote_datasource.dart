
import 'package:english_dictionary/core/error/failures.dart';
import 'package:english_dictionary/data/datasources/remote/dictionary_chopper_service.dart';
import 'package:english_dictionary/data/models/word_model.dart';
import 'package:english_dictionary/domain/entities/word_entity.dart';
import 'dart:convert';

abstract class DictionaryRemoteDatasource {
  Future<WordEntity> getWord(String word);
}

class DictionaryRemoteDatasourceImpl implements DictionaryRemoteDatasource {
  final DictionaryChopperService _service;

  DictionaryRemoteDatasourceImpl(this._service);

  @override
  Future<WordEntity> getWord(String word) async {
    final response = await _service.getWord(word);

    if (response.isSuccessful) {
      final body = response.body;

      if (body is List && body.isNotEmpty) {
        final models = body
            .map((e) => WordModelMapper.fromMap(e as Map<String, dynamic>))
            .toList();
        return mergeWordModels(models, WordSource.remote);
      }

      throw WordNotFoundException(
        word: word,
        message: 'No definitions found for "$word"',
      );
    }
    Map<String, dynamic>? errorMap;

    try {
      final err = response.error;
      if (err is String) {
        errorMap = json.decode(err) as Map<String, dynamic>;
      } else if (err is Map) {
        errorMap = Map<String, dynamic>.from(err);
      }
    } catch (_) {}

    final title = errorMap?['title'] as String? ?? '';
    if (title == 'No Definitions Found') {
      throw WordNotFoundException(
        word: word,
        message:
            errorMap?['message'] as String? ??
            'No defeinitions found for "$word',
      );
    }

    throw NetworkException(message: 'HTTP ${response.statusCode} for "$word".', statusCode: response.statusCode);
  }
}
