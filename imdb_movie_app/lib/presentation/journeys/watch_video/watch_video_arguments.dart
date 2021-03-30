import 'package:flutter/material.dart';
import 'package:imdb_movie_app/domain/entities/video_entity.dart';

class WatchVideoArguments {
  final List<VideoEntity> videos;

  WatchVideoArguments({
    @required this.videos,
  });
}
