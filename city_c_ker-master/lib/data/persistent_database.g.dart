
part of 'persistent_database.dart';

class FavoriteCity extends DataClass implements Insertable<FavoriteCity> {
  final String city;
  final String state;
  final String district;
  FavoriteCity(
      {@required this.city, @required this.state, @required this.district});
  factory FavoriteCity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return FavoriteCity(
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      district: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}district']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || district != null) {
      map['district'] = Variable<String>(district);
    }
    return map;
  }

  FavoriteCitiesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteCitiesCompanion(
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
    );
  }

  factory FavoriteCity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteCity(
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      district: serializer.fromJson<String>(json['district']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
      'district': serializer.toJson<String>(district),
    };
  }

  FavoriteCity copyWith({String city, String state, String district}) =>
      FavoriteCity(
        city: city ?? this.city,
        state: state ?? this.state,
        district: district ?? this.district,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteCity(')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('district: $district')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(city.hashCode, $mrjc(state.hashCode, district.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FavoriteCity &&
          other.city == this.city &&
          other.state == this.state &&
          other.district == this.district);
}

class FavoriteCitiesCompanion extends UpdateCompanion<FavoriteCity> {
  final Value<String> city;
  final Value<String> state;
  final Value<String> district;
  const FavoriteCitiesCompanion({
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.district = const Value.absent(),
  });
  FavoriteCitiesCompanion.insert({
    @required String city,
    @required String state,
    @required String district,
  })  : city = Value(city),
        state = Value(state),
        district = Value(district);
  static Insertable<FavoriteCity> custom({
    Expression<String> city,
    Expression<String> state,
    Expression<String> district,
  }) {
    return RawValuesInsertable({
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (district != null) 'district': district,
    });
  }

  FavoriteCitiesCompanion copyWith(
      {Value<String> city, Value<String> state, Value<String> district}) {
    return FavoriteCitiesCompanion(
      city: city ?? this.city,
      state: state ?? this.state,
      district: district ?? this.district,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCitiesCompanion(')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('district: $district')
          ..write(')'))
        .toString();
  }
}

class $FavoriteCitiesTable extends FavoriteCities
    with TableInfo<$FavoriteCitiesTable, FavoriteCity> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavoriteCitiesTable(this._db, [this._alias]);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn(
      'city',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      false,
    );
  }

  final VerificationMeta _districtMeta = const VerificationMeta('district');
  GeneratedTextColumn _district;
  @override
  GeneratedTextColumn get district => _district ??= _constructDistrict();
  GeneratedTextColumn _constructDistrict() {
    return GeneratedTextColumn(
      'district',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [city, state, district];
  @override
  $FavoriteCitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorite_cities';
  @override
  final String actualTableName = 'favorite_cities';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteCity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('district')) {
      context.handle(_districtMeta,
          district.isAcceptableOrUnknown(data['district'], _districtMeta));
    } else if (isInserting) {
      context.missing(_districtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {city, state, district};
  @override
  FavoriteCity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavoriteCity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FavoriteCitiesTable createAlias(String alias) {
    return $FavoriteCitiesTable(_db, alias);
  }
}

abstract class _$PersistentDatabase extends GeneratedDatabase {
  _$PersistentDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $FavoriteCitiesTable _favoriteCities;
  $FavoriteCitiesTable get favoriteCities =>
      _favoriteCities ??= $FavoriteCitiesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteCities];
}
