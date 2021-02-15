import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:newyork_times_test_app/data/common.dart';
import 'package:newyork_times_test_app/pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initState();

  runApp(MyApp());
}

Future initState() async {
  prefs = await SharedPreferences.getInstance();
  lastUpdatedNewsDate = prefs.getString('lastUpdatedNewsDate');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
