import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:city_c_ker/data/built_value_converter.dart';

part 'cities_api_service.chopper.dart';

@ChopperApi(baseUrl: '/cities')
abstract class CitiesApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltCity>>> getCities();

  @Get()
  Future<Response<BuiltList<BuiltCity>>> getParticularCities(
      {@Query('City') String city,
      @Query('District') String district,
      @Query('State') String state});
  
  @Get()
  Future<Response<BuiltList<BuiltCity>>> searchFromCities({@Query('City_like') String cityLike,
      @Query('District_like') String districtLike,
      @Query('State_like') String stateLike});

  static CitiesApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://indian-cities-api-nocbegfhqg.now.sh', //Given Query Used
      services: [
        _$CitiesApiService(),
      ],
      converter: BuiltValueConverter(),
    );
    return _$CitiesApiService(client);
  }
}
