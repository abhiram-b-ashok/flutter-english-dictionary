
import 'package:chopper/chopper.dart';
import 'dictionary_chopper_service.dart';

ChopperClient buildChopperClient() {
  return ChopperClient(
    baseUrl: Uri.parse('https://api.dictionaryapi.dev'),
    services: [
      DictionaryChopperService.create(),
    ],
    converter: JsonConverter(),
    interceptors: [
      HttpLoggingInterceptor(),
      HeadersInterceptor(const {'Content-Type': 'application/json'}),
    ],
  );
}