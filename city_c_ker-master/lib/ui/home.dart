import 'package:city_c_ker/ui/show_all_cities.dart';
import 'package:city_c_ker/ui/show_favorites.dart';
import 'package:city_c_ker/util/city_search_delegate.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wednesday Solution'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CitySearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShowFavoriteCities(),
              ),
            ),
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShowFavoriteCities(),
                ),
              ),
          label: Text('Favorites'),
          icon: Icon(Icons.favorite_border)),
      body: ShowAllCities(),
    );
  }
}
