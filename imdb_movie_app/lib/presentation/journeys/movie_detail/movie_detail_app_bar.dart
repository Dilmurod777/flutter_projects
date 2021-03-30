import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movie_app/common/constants/size_constants.dart';
import 'package:imdb_movie_app/domain/entities/movie_detail_entity.dart';
import 'package:imdb_movie_app/domain/entities/movie_entity.dart';
import 'package:imdb_movie_app/presentation/blocs/favorite/favorite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({
    Key key,
    @required this.movieDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(
            cubit: BlocProvider.of<FavoriteBloc>(context),
            builder: (context, state) {
              if (state is IsFavoriteMovie) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavoriteBloc>(context).add(
                      FavoriteToggleMovieEvent(
                        MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                        state.isFavoriteMovie,
                      ),
                    );
                  },
                  child: Icon(
                    state.isFavoriteMovie
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                    size: Sizes.dimen_12.h,
                  ),
                );
              }

              return Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              );
            }),
      ],
    );
  }
}
