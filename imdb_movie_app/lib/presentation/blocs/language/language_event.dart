part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity language;

  ToggleLanguageEvent(this.language);

  @override
  List<Object> get props => [language.code];
}

class LoadPreferredLanguageEvent extends LanguageEvent {
  @override
  List<Object> get props => [];
}
