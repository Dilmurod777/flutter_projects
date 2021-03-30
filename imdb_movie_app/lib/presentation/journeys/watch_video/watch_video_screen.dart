import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/common/constants/size_constants.dart';
import 'package:imdb_movie_app/common/constants/translation_constants.dart';
import 'package:imdb_movie_app/common/extensions/string_extensions.dart';
import 'package:imdb_movie_app/domain/entities/video_entity.dart';
import 'package:imdb_movie_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:imdb_movie_app/presentation/themes/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  WatchVideoScreen({
    @required this.watchVideoArguments,
  });

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  int _currentVideoIndex = 0;
  List<VideoEntity> _videos;
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[_currentVideoIndex].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.watchTrailers.t(context),
        ),
        centerTitle: true,
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
            RemainingDuration(),
            FullScreenButton(),
          ],
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < _videos.length; i++)
                        Container(
                          color: _currentVideoIndex == i
                              ? AppColor.royalBlue.withOpacity(0.2)
                              : Colors.transparent,
                          height: Sizes.dimen_60.h,
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.dimen_8.h,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (_currentVideoIndex != i) {
                                _currentVideoIndex = i;
                                _controller.load(_videos[i].key);
                                _controller.play();

                                setState(() {});
                              }
                            },
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  width: Sizes.dimen_200.w,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key,
                                    quality: ThumbnailQuality.high,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Sizes.dimen_8.w,
                                    ),
                                    child: Text(
                                      _videos[i].title,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
