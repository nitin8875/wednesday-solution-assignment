
part of 'built_city.dart';


Serializer<BuiltCity> _$builtCitySerializer = new _$BuiltCitySerializer();

class _$BuiltCitySerializer implements StructuredSerializer<BuiltCity> {
  @override
  final Iterable<Type> types = const [BuiltCity, _$BuiltCity];
  @override
  final String wireName = 'BuiltCity';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltCity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'City',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'District',
      serializers.serialize(object.district,
          specifiedType: const FullType(String)),
      'State',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltCity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltCityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'City':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'District':
          result.district = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'State':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltCity extends BuiltCity {
  @override
  final String city;
  @override
  final String district;
  @override
  final String state;

  factory _$BuiltCity([void Function(BuiltCityBuilder) updates]) =>
      (new BuiltCityBuilder()..update(updates)).build();

  _$BuiltCity._({this.city, this.district, this.state}) : super._() {
    if (city == null) {
      throw new BuiltValueNullFieldError('BuiltCity', 'city');
    }
    if (district == null) {
      throw new BuiltValueNullFieldError('BuiltCity', 'district');
    }
    if (state == null) {
      throw new BuiltValueNullFieldError('BuiltCity', 'state');
    }
  }

  @override
  BuiltCity rebuild(void Function(BuiltCityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltCityBuilder toBuilder() => new BuiltCityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltCity &&
        city == other.city &&
        district == other.district &&
        state == other.state;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, city.hashCode), district.hashCode), state.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltCity')
          ..add('city', city)
          ..add('district', district)
          ..add('state', state))
        .toString();
  }
}

class BuiltCityBuilder implements Builder<BuiltCity, BuiltCityBuilder> {
  _$BuiltCity _$v;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _district;
  String get district => _$this._district;
  set district(String district) => _$this._district = district;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  BuiltCityBuilder();

  BuiltCityBuilder get _$this {
    if (_$v != null) {
      _city = _$v.city;
      _district = _$v.district;
      _state = _$v.state;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltCity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltCity;
  }

  @override
  void update(void Function(BuiltCityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltCity build() {
    final _$result =
        _$v ?? new _$BuiltCity._(city: city, district: district, state: state);
    replace(_$result);
    return _$result;
  }
}

