import 'package:city_c_ker/models/built_city.dart';
import 'package:city_c_ker/models/serializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  test(
      'Parsing single json object. Note - To parse multiple such objects we map each obj individually. Spo we need to test only single obj',
      () {
    const jsonString =
        """{"City": "SGM","State": "Rajasthan","District": "Ganganagar"}""";
    expect(
        serializers
            .deserializeWith(serializers.serializerForType(BuiltCity),
                json.decode(jsonString))
            .city,
        'SGM');
  });
}
