import 'dart:math';
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:city_c_ker/data/persistent_database.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:city_c_ker/data/cities_api_service.dart';
import 'package:city_c_ker/data/service_locator.dart';
import 'package:city_c_ker/widgets/city_list_tile.dart';
import 'package:flutter/material.dart';

class CitySearchDelegate extends SearchDelegate {
  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query == ''
        ? Center(child: Text('Enter keyword'))
        : FutureBuilder<Response<BuiltList<BuiltCity>>>(
            future:
                locator<CitiesApiService>().searchFromCities(cityLike: query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.body.length == 0)
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'No results found!',
                      ),
                    ),
                  );

                BuiltList list = snapshot.data.body
                    .sublist(0, min(snapshot.data.body.length, 5));
                return ListView(
                  children: list
                      .map<Widget>(
                        (city) => ListTile(
                          title: Text(city.city),
                          onTap: () {
                            query = city.city;
                            showResults(context);
                          },
                        ),
                      )
                      .toList()
                        ..add(
                          Align(
                            alignment: Alignment.topCenter,
                            child: FlatButton(
                              child: Text('See results'),
                              onPressed: () => showResults(context),
                            ),
                          ),
                        ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Response<BuiltList<BuiltCity>>>(
      future: locator<CitiesApiService>().searchFromCities(cityLike: query),
      builder: (context, snapshot) {
        return StreamBuilder<List<FavoriteCity>>(
            stream: locator<PersistentDatabase>().watchAllFavoriteCities(),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.hasData && snapshot.hasData) {
                if (snapshot.data.body.length == 0)
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'No results to show!',
                    ),
                  );

                return ListView.builder(
                  itemCount: snapshot.data.body.length,
                  itemBuilder: (context, index) => CityListTile(
                    snapshot.data.body[index],
                    streamSnapshot.data.contains(
                      builtValueToFavoriteCity(snapshot.data.body[index]),
                    ),
                  ),
                );
              } else
                return Center(child: CircularProgressIndicator());
            });
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      ),
    ];
  }
}
