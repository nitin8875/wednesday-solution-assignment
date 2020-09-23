import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:city_c_ker/data/cities_api_service.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Parsing over network - Api Service', () {
    CitiesApiService service = CitiesApiService.create();
    test('Get Cities', () async {
      Response<BuiltList<BuiltCity>> res = await service.getCities();

      expect(res.body.first.city, 'SGM');
    });
    test('Get Particular City',
        () async {
      Response<BuiltList<BuiltCity>> res =
          await service.getParticularCities(district: "Dharwad");
      expect(res.body.first.city, 'Alnavar');
    });
    test('Search City', () async {
      Response<BuiltList<BuiltCity>> res =
          await service.searchFromCities(cityLike: "Mumb");
      expect(res.body.first.city, 'Greater Mumbai');
    });
  });
}
