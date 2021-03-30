part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();
}

class VideosInitial extends VideosState {
  @override
  List<Object> get props => [];
}

class VideosLoaded extends VideosState {
  final List<VideoEntity> videos;

  VideosLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}

class NoVideos extends VideosState {
  @override
  List<Object> get props => [];
}
