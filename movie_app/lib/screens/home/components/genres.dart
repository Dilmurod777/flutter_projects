import 'package:flutter/material.dart';
import 'package:movie_app/components/genre_card.dart';

import '../../../constraints.dart';

class Genres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Action",
      "Crime",
      "Comedy",
      "Drama",
      "Horror",
      "Animation"
    ];

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => GenreCard(genre: genres[index]),
      ),
    );
  }
}
