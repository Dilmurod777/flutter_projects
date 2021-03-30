import 'package:dartz/dartz.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';

abstract class AuthenticationRepository{
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body);
  Future<Either<AppError, void>> logoutUser();
}