import 'package:dartz/dartz.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/movie_entity.dart';
import 'package:imdb_movie_app/domain/repositories/movie_repository.dart';
import 'package:imdb_movie_app/domain/usecases/usecase.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity movieEntity) async {
    return await movieRepository.saveMovie(movieEntity);
  }
}
