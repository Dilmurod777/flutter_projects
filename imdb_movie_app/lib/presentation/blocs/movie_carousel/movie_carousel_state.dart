part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();
}

class MovieCarouselInitial extends MovieCarouselState {
  @override
  List<Object> get props => [];
}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType errorType;

  MovieCarouselError(this.errorType);

  @override
  List<Object> get props => [];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}
