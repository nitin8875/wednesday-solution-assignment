import 'dart:io';
import 'package:city_c_ker/ui/home.dart';
import 'package:city_c_ker/ui/show_favorites.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    } on SocketException catch (_) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ShowFavoriteCities()));
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Wednesday\nSolution',
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 150,
          ),
          JumpingDotsProgressIndicator(
            fontSize: 48,
            color: Colors.white70,
          ),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
