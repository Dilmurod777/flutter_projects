part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();
}

class VideosLoadedEvent extends VideosEvent {
  final int movieId;

  VideosLoadedEvent({@required this.movieId});

  @override
  List<Object> get props => [movieId];
}
