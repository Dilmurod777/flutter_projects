part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  MovieTabChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}
