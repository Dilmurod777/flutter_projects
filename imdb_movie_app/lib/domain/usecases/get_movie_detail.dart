import 'package:dartz/dartz.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:imdb_movie_app/domain/entities/movie_params.dart';
import 'package:imdb_movie_app/domain/repositories/movie_repository.dart';
import 'package:imdb_movie_app/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(MovieParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}
