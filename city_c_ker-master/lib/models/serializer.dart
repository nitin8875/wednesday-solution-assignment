import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:city_c_ker/models/built_city.dart';

part 'serializer.g.dart';

@SerializersFor(const [BuiltCity])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
