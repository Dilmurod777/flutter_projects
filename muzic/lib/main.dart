import 'package:flutter/material.dart';
import './common/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF181B2C),
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
