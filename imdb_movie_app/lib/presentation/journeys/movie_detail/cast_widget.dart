import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movie_app/common/constants/size_constants.dart';
import 'package:imdb_movie_app/data/core/api_constants.dart';
import 'package:imdb_movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:imdb_movie_app/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return Container(
              height: Sizes.dimen_105.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.casts.length,
                itemBuilder: (context, index) {
                  final cast = state.casts[index];

                  return Container(
                    height: Sizes.dimen_100.h,
                    width: Sizes.dimen_160.w,
                    child: Card(
                      elevation: 1,
                      margin: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_8.w,
                        vertical: Sizes.dimen_4.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Sizes.dimen_8.w,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Sizes.dimen_8.w,
                              ),
                              child: CachedNetworkImage(
                                height: Sizes.dimen_100.h,
                                width: Sizes.dimen_160.w,
                                imageUrl:
                                    "${ApiConstants.BASE_IMAGE_URL}${cast.posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_8.w,
                            ),
                            child: Text(
                              cast.name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style:
                                  Theme.of(context).textTheme.vulcanBodyText2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: Sizes.dimen_8.w,
                              right: Sizes.dimen_8.w,
                              bottom: Sizes.dimen_4.h,
                            ),
                            child: Text(
                              cast.character,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
        }

        return SizedBox.shrink();
      },
    );
  }
}
