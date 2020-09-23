import 'package:city_c_ker/models/built_city.dart';
import 'package:city_c_ker/models/serializer.dart';
import 'package:city_c_ker/widgets/city_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  testWidgets('Testing CityListTile', (WidgetTester tester) async {
    const jsonString =
        """{"City": "SGM","State": "Rajasthan","District": "Ganganagar"}""";
    BuiltCity parsedBuiltCity = serializers.deserializeWith(
        serializers.serializerForType(BuiltCity), json.decode(jsonString));
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: CityListTile(parsedBuiltCity, false),
        ),
      ),
    );
    expect(find.text('SGM'), findsOneWidget);
    expect(find.text('Rajasthan'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: CityListTile(parsedBuiltCity, true),
        ),
      ),
    );
    expect(find.text('SGM'), findsOneWidget);
    expect(find.text('Rajasthan'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);
  });
}
