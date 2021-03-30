import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movie_app/common/constants/routes_constants.dart';
import 'package:imdb_movie_app/common/constants/translation_constants.dart';
import 'package:imdb_movie_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:imdb_movie_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:imdb_movie_app/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key key,
    @required this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final videos = state.videos;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Button(
              text: TranslationConstants.watchTrailers,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteList.watchTrailer,
                  arguments: WatchVideoArguments(
                    videos: videos,
                  ),
                );
              },
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
