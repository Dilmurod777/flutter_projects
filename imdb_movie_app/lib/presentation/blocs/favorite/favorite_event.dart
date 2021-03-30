part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteLoadMoviesEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class FavoriteDeleteMovieEvent extends FavoriteEvent {
  final int movieId;

  FavoriteDeleteMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class FavoriteToggleMovieEvent extends FavoriteEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  FavoriteToggleMovieEvent(this.movieEntity, this.isFavorite);

  @override
  List<Object> get props => [movieEntity, isFavorite];
}

class FavoriteCheckIfMovieEvent extends FavoriteEvent {
  final int movieId;

  FavoriteCheckIfMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
