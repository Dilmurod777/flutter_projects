import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movie_app/common/constants/translation_constants.dart';
import 'package:imdb_movie_app/common/extensions/string_extensions.dart';
import 'package:imdb_movie_app/di/get_it.dart';
import 'package:imdb_movie_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:imdb_movie_app/presentation/journeys/favorite/favorite_movies_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteBloc = getItInstance<FavoriteBloc>();
    _favoriteBloc.add(FavoriteLoadMoviesEvent());
    super.initState();
  }

  @override
  void dispose() {
    _favoriteBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.favoriteMovies.t(context),
        ),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          cubit: _favoriteBloc,
          builder: (context, state) {
            if (state is FavoriteMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstants.noFavoriteMovies.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }

              return FavoriteMoviesGridView(
                movies: state.movies,
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
