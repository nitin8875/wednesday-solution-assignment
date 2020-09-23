import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_city.g.dart';

abstract class BuiltCity implements Built<BuiltCity, BuiltCityBuilder>{

  @BuiltValueField(wireName: 'City')
  String get city;
  @BuiltValueField(wireName: 'District')
  String get district;
  @BuiltValueField(wireName: 'State')
  String get state;


  BuiltCity._();

  factory BuiltCity([updates(BuiltCityBuilder b)]) = _$BuiltCity;

  static Serializer<BuiltCity> get serializer => _$builtCitySerializer;

}