
// Thrown when the API returns its 404 JSON shape: {"title":"No Definitions Found","message":"...","resolution":"..."}
class WordNotFoundException implements Exception {
  final String word;
  final String message;

  const WordNotFoundException({
    required this.word,
    this.message = 'No definitions found for this word.',
  });

  @override
  String toString() => 'WordNotFoundException: "$word" — $message';
}

// Thrown when the device is offline and the word is not in local source.
class OfflineException implements Exception {
  final String message;

  const OfflineException({
    this.message = 'You are offline and this word is not in your local dictionary.',
  });

  @override
  String toString() => 'OfflineException: $message';
}

// Thrown for HTTP errors.
class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  const NetworkException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'NetworkException[$statusCode]: $message';
}

