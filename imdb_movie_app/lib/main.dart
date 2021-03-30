import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:imdb_movie_app/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'package:imdb_movie_app/di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:imdb_movie_app/data/tables/movie_table.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  final appDocumentsDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(MovieTableAdapter());

  unawaited(getIt.init());
  runApp(MovieApp());
}
