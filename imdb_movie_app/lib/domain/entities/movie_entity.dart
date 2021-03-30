import 'package:equatable/equatable.dart';
import 'package:imdb_movie_app/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final num voteAverage;
  final String posterPath;
  final String backdropPath;
  final String title;
  final String releaseDate;
  final String overview;

  MovieEntity({
    this.id,
    this.voteAverage,
    this.posterPath,
    this.backdropPath,
    this.title,
    this.releaseDate,
    this.overview,
  }) : assert(id != null, "Movie id must not be null");

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      id: movieDetailEntity.id,
      title: movieDetailEntity.title,
      backdropPath: movieDetailEntity.backdropPath,
      posterPath: movieDetailEntity.posterPath,
      releaseDate: movieDetailEntity.releaseDate,
      overview: movieDetailEntity.overview,
      voteAverage: movieDetailEntity.voteAverage,
    );
  }
}
