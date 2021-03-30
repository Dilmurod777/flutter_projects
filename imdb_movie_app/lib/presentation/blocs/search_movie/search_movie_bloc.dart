import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/movie_entity.dart';
import 'package:imdb_movie_app/domain/entities/movie_search_params.dart';
import 'package:imdb_movie_app/domain/usecases/search_movies.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({
    @required this.searchMovies,
  }) : super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();

        final Either<AppError, List<MovieEntity>> eitherResponse =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));

        yield eitherResponse.fold(
          (error) => SearchMovieError(error.appErrorType),
          (movies) => SearchMovieLoaded(movies: movies),
        );
      }
    }
  }
}
