import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/movie_entity.dart';
import 'package:imdb_movie_app/domain/entities/movie_params.dart';
import 'package:imdb_movie_app/domain/entities/no_params.dart';
import 'package:imdb_movie_app/domain/usecases/check_if_favorite_movie.dart';
import 'package:imdb_movie_app/domain/usecases/delete_favourite_movie.dart';
import 'package:imdb_movie_app/domain/usecases/get_favorite_movies.dart';
import 'package:imdb_movie_app/domain/usecases/save_movie.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final DeleteFavoriteMovie deleteFavouriteMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteBloc({
    @required this.saveMovie,
    @required this.deleteFavouriteMovie,
    @required this.getFavoriteMovies,
    @required this.checkIfFavoriteMovie,
  }) : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FavoriteToggleMovieEvent) {
      if (event.isFavorite) {
        await deleteFavouriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }

      final response =
          await checkIfFavoriteMovie(MovieParams(event.movieEntity.id));
      yield response.fold(
        (l) => FavoriteMoviesError(),
        (isFavorite) => IsFavoriteMovie(isFavorite),
      );
    } else if (event is FavoriteLoadMoviesEvent) {
      yield* _fetchFavoriteLoadMovies();
    } else if (event is FavoriteDeleteMovieEvent) {
      await deleteFavouriteMovie(MovieParams(event.movieId));
      yield* _fetchFavoriteLoadMovies();
    } else if (event is FavoriteCheckIfMovieEvent) {
      final response = await checkIfFavoriteMovie(MovieParams(event.movieId));
      yield response.fold(
        (l) => FavoriteMoviesError(),
        (isFavorite) => IsFavoriteMovie(isFavorite),
      );
    }
  }

  Stream<FavoriteState> _fetchFavoriteLoadMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());
    yield response.fold(
      (l) => FavoriteMoviesError(),
      (movies) => FavoriteMoviesLoaded(movies),
    );
  }
}
