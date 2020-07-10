import 'package:flutter/material.dart';

import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(),
          Genres(),
          MovieCarousel(),
        ],
      ),
    );
  }
}
