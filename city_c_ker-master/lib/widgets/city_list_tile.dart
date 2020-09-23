import 'package:city_c_ker/data/persistent_database.dart';
import 'package:city_c_ker/data/service_locator.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:city_c_ker/ui/show_city.dart';
import 'package:flutter/material.dart';

class CityListTile extends StatelessWidget {
  final BuiltCity builtCity;
  final bool isFavorite;
  final FavoriteCity favoriteCityObject;
  CityListTile(this.builtCity, this.isFavorite)
      : favoriteCityObject = builtValueToFavoriteCity(builtCity);
  CityListTile.fromFavoriteCity(this.favoriteCityObject)
      : builtCity = null,
        isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            title: Text(favoriteCityObject.city),
            subtitle: Text(favoriteCityObject.state),
            trailing: IconButton(
              icon: isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).accentColor,
                    )
                  : Icon(Icons.favorite_border),
              onPressed: () {
                if (isFavorite) {
                  locator<PersistentDatabase>()
                      .deleteFavoriteCity(favoriteCityObject);
                } else {
                  locator<PersistentDatabase>()
                      .insertFavoriteCity(favoriteCityObject);
                }
              },
            ),
            onTap: () => builtCity != null
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShowCity(builtCity),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
