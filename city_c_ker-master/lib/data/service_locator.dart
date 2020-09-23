import 'package:city_c_ker/data/persistent_database.dart';
import 'package:get_it/get_it.dart';
import 'package:city_c_ker/data/cities_api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<CitiesApiService>(CitiesApiService.create());
  locator.registerSingleton<PersistentDatabase>(PersistentDatabase());
}
