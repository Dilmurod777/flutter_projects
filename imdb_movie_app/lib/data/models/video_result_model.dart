import 'package:imdb_movie_app/data/models/video_model.dart';

class VideoResultModel {
  int id;
  List<VideoModel> videos;

  VideoResultModel({this.id, this.videos});

  VideoResultModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    List<VideoModel> videos = [];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        videos.add(new VideoModel.fromJson(v));
      });
    }

    this.videos = videos;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.videos != null) {
      data['results'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}