import 'package:city_c_ker/data/persistent_database.dart';
import 'package:city_c_ker/data/service_locator.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:flutter/material.dart';

class ShowCity extends StatelessWidget {
  final BuiltCity city;
  ShowCity(this.city);
  @override
  Widget build(BuildContext context) {
    TextStyle _style = Theme.of(context).textTheme.headline6;
    return StreamBuilder<List<FavoriteCity>>(
      stream: locator<PersistentDatabase>().watchAllFavoriteCities(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool _isFavorite = snapshot.data.contains(
            builtValueToFavoriteCity(city),
          );
          return Scaffold(
            appBar: AppBar(
              title: Text(city.city),
              centerTitle: true,
              leading: BackButton(),
              elevation: 0,
            ),
            floatingActionButton: FloatingActionButton(
              child: _isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                if (_isFavorite) {
                  locator<PersistentDatabase>()
                      .deleteFavoriteCity(builtValueToFavoriteCity(city));
                } else {
                  locator<PersistentDatabase>()
                      .insertFavoriteCity(builtValueToFavoriteCity(city));
                }
              },
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 150.0, 32.0, 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    city.city,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 64),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'City Name :',
                        style: _style.copyWith(fontWeight: FontWeight.w300),
                      ),
                      Spacer(),
                      Text(
                        city.city,
                        style: _style,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'State Name :',
                        style: _style.copyWith(fontWeight: FontWeight.w300),
                      ),
                      Spacer(),
                      Text(
                        city.state,
                        style: _style,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'District Name :',
                        style: _style.copyWith(fontWeight: FontWeight.w300),
                      ),
                      Spacer(),
                      Text(
                        city.district,
                        style: _style,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
