import 'package:dartz/dartz.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/movie_entity.dart';
import 'package:imdb_movie_app/domain/entities/no_params.dart';
import 'package:imdb_movie_app/domain/repositories/movie_repository.dart';
import 'package:imdb_movie_app/domain/usecases/usecase.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getFavoriteMovies();
  }
}
