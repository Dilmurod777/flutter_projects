import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movie_app/common/constants/size_constants.dart';
import 'package:imdb_movie_app/common/constants/translation_constants.dart';
import 'package:imdb_movie_app/common/extensions/string_extensions.dart';
import 'package:imdb_movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:imdb_movie_app/presentation/journeys/seach_movie/search_movie_card.dart';
import 'package:imdb_movie_app/presentation/themes/app_color.dart';
import 'package:imdb_movie_app/presentation/themes/theme_text.dart';
import 'package:imdb_movie_app/presentation/widgets/app_error_widget.dart';

class CustomSearchMovieDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchMovieDelegate({
    @required this.searchMovieBloc,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc?.add(
      SearchTermChangedEvent(searchTerm: query),
    );

    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      cubit: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onPressed: () => searchMovieBloc?.add(
              SearchTermChangedEvent(searchTerm: query),
            ),
          );
        } else if (state is SearchMovieLoaded) {
          final movies = state.movies;

          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_60.w,
                ),
                child: Text(
                  TranslationConstants.noMovieSearched.t(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
