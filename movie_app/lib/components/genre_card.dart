import 'package:flutter/material.dart';

import '../constraints.dart';

class GenreCard extends StatelessWidget {
  final String genre;

  GenreCard({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(
          color: kTextColor.withOpacity(0.8),
          fontSize: 16,
        ),
      ),
    );
  }
}
