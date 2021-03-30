import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/common/constants/languages.dart';
import 'package:imdb_movie_app/domain/entities/language_entity.dart';
import 'package:imdb_movie_app/domain/entities/no_params.dart';
import 'package:imdb_movie_app/domain/usecases/get_preferred_language.dart';
import 'package:imdb_movie_app/domain/usecases/update_language.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    @required this.updateLanguage,
    @required this.getPreferredLanguage,
  }) : super(
          LanguageLoaded(
            Locale(Languages.languages[0].code),
          ),
        );

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      await updateLanguage(event.language.code);
      yield LanguageLoaded(Locale(event.language.code));
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(NoParams());
      yield response.fold(
        (l) => LanguageError(),
        (language) => LanguageLoaded(Locale(language)),
      );
    }
  }
}
