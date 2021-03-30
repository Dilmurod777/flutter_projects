import 'package:flutter/material.dart';
import 'package:imdb_movie_app/common/constants/routes_constants.dart';
import 'package:imdb_movie_app/data/data_sources/authentication_local_data_source.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String sessionId;

  @override
  void initState() {
    checkIfLoggedIn();
    super.initState();
  }

  void checkIfLoggedIn() async {
    sessionId = await AuthenticationLocalDataSourceImpl().getSessionId();

    if (sessionId == null || sessionId.isEmpty) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteList.login, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteList.home, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
    );
  }
}
