import 'package:city_c_ker/data/persistent_database.dart';
import 'package:city_c_ker/data/service_locator.dart';
import 'package:city_c_ker/widgets/city_list_tile.dart';
import 'package:flutter/material.dart';

class ShowFavoriteCities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        leading: BackButton(),
        elevation: 0,
      ),
      body: StreamBuilder<List<FavoriteCity>>(
          stream: locator<PersistentDatabase>().watchAllFavoriteCities(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => CityListTile.fromFavoriteCity(
                  snapshot.data[index],
                ),
              );
            else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
