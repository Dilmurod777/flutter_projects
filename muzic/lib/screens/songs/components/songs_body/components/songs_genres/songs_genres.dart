import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';

import 'components/songs_genres_item/songs_genres_item.dart';

class SongsGenres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                List.filled(20, 0).map((index) => SongsGenresItem()).toList(),
          ),
        ),
      ),
    );
  }
}
