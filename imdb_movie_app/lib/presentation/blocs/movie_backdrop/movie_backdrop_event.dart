part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();
}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movie;

  const MovieBackdropChangedEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
