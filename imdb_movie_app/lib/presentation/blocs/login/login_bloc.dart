import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/common/constants/translation_constants.dart';
import 'package:imdb_movie_app/domain/entities/app_error.dart';
import 'package:imdb_movie_app/domain/entities/login_request_params.dart';
import 'package:imdb_movie_app/domain/entities/no_params.dart';
import 'package:imdb_movie_app/domain/usecases/login_user.dart';
import 'package:imdb_movie_app/domain/usecases/logout_user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;

  LoginBloc({
    @required this.loginUser,
    @required this.logoutUser,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginInitiateEvent) {
      final Either<AppError, bool> eitherResponse = await loginUser(
        LoginRequestParams(
          userName: event.username,
          password: event.password,
        ),
      );

      yield eitherResponse.fold(
        (error) {
          var message = getErrorMessage(error.appErrorType);
          return LoginError(message);
        },
        (_) => LoginSuccess(),
      );
    } else if (event is LogoutEvent) {
      await logoutUser(NoParams());
      yield LogoutSuccess();
    }
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return TranslationConstants.noNetwork;
      case AppErrorType.api:
      case AppErrorType.database:
        return TranslationConstants.somethingWentWrong;
      case AppErrorType.sessionDenied:
        return TranslationConstants.sessionDenied;
      default:
        return TranslationConstants.wrongUsernamePassword;
    }
  }
}
