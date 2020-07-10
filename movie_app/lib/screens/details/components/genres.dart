import 'package:flutter/material.dart';
import 'package:movie_app/components/genre_card.dart';
import 'package:movie_app/constraints.dart';
import 'package:movie_app/models/movie.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: kDefaultPadding / 2,
        left: kDefaultPadding,
      ),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.genra.length,
          itemBuilder: (context, index) => GenreCard(genre: movie.genra[index]),
        ),
      ),
    );
  }
}
