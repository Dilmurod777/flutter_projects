import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:imdb_movie_app/domain/entities/movie_params.dart';
import 'package:imdb_movie_app/domain/usecases/get_movie_detail.dart';
import 'package:imdb_movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:imdb_movie_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:imdb_movie_app/presentation/blocs/videos/videos_bloc.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;

  MovieDetailBloc({
    @required this.getMovieDetail,
    @required this.castBloc,
    @required this.videosBloc,
    @required this.favoriteBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => MovieDetailError(),
        (movie) => MovieDetailLoaded(movie),
      );

      favoriteBloc.add(FavoriteCheckIfMovieEvent(event.movieId));
      castBloc.add(CastLoadEvent(movieId: event.movieId));
      videosBloc.add(VideosLoadedEvent(movieId: event.movieId));
    }
  }
}
