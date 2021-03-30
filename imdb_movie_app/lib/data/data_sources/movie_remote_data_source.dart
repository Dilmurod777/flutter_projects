import 'package:imdb_movie_app/data/core/api_client.dart';
import 'package:imdb_movie_app/data/models/cast_result_model.dart';
import 'package:imdb_movie_app/data/models/movie_detail_model.dart';
import 'package:imdb_movie_app/data/models/movie_model.dart';
import 'package:imdb_movie_app/data/models/movie_result_model.dart';
import 'package:imdb_movie_app/data/models/video_model.dart';
import 'package:imdb_movie_app/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getPlayingNow();

  Future<List<MovieModel>> getComingSoon();

  Future<List<MovieModel>> getSearchMovies(String searchTerm);

  Future<MovieDetailModel> getMovieDetail(int id);

  Future<List<CastModel>> getCast(int id);

  Future<List<VideoModel>> getVideos(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getCast(int id) async {
    final response = await _client.get('movie/$id/credits');
    print(response);
    final cast = CastResultModel.fromJson(response).cast;
    print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    print(response);
    final videos = VideoResultModel.fromJson(response).videos;
    print(videos);
    return videos;
  }

  @override
  Future<List<MovieModel>> getSearchMovies(String searchTerm) async {
    final response = await _client.get(
      'search/movie',
      params: {
        'query': searchTerm,
      },
    );
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
