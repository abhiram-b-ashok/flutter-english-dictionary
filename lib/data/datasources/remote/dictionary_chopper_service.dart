import 'package:chopper/chopper.dart';

part 'dictionary_chopper_service.chopper.dart';

@ChopperApi(baseUrl: '/api/v2/entries/en')
abstract class DictionaryChopperService extends ChopperService {
  static DictionaryChopperService create([ChopperClient? client]) =>
      _$DictionaryChopperService(client);

  @GET(path: '/{word}')
  Future<Response<dynamic>> getWord(@Path('word') String word);
}