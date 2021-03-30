part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();
}

class SearchMovieInitial extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movies;

  SearchMovieLoaded({
    @required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class SearchMovieLoading extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieError extends SearchMovieState {
  final AppErrorType errorType;

  SearchMovieError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
