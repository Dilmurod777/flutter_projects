import 'package:dartz/dartz.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/cast_entity.dart';
import 'package:imdb_movie_app/domain/entities/movie_params.dart';
import 'package:imdb_movie_app/domain/repositories/movie_repository.dart';
import 'package:imdb_movie_app/domain/usecases/usecase.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await repository.getCast(params.id);
  }
}
