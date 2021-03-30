part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
}

class CastLoadEvent extends CastEvent {
  final int movieId;

  CastLoadEvent({
    @required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
