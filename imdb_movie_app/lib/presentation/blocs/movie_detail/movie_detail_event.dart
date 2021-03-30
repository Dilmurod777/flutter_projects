part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class MovieDetailLoadEvent extends MovieDetailEvent{
  final int movieId;

  MovieDetailLoadEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
