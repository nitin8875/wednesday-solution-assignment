
part of 'cities_api_service.dart';

class _$CitiesApiService extends CitiesApiService {
  _$CitiesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CitiesApiService;

  @override
  Future<Response<BuiltList<BuiltCity>>> getCities() {
    final $url = '/cities';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<BuiltCity>, BuiltCity>($request);
  }

  @override
  Future<Response<BuiltList<BuiltCity>>> getParticularCities(
      {String city, String district, String state}) {
    final $url = '/cities';
    final $params = <String, dynamic>{
      'City': city,
      'District': district,
      'State': state
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<BuiltCity>, BuiltCity>($request);
  }

  @override
  Future<Response<BuiltList<BuiltCity>>> searchFromCities(
      {String cityLike, String districtLike, String stateLike}) {
    final $url = '/cities';
    final $params = <String, dynamic>{
      'City_like': cityLike,
      'District_like': districtLike,
      'State_like': stateLike
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<BuiltCity>, BuiltCity>($request);
  }
}
