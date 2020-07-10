import 'package:flutter/material.dart';
import 'package:movie_app/constraints.dart';
import 'package:movie_app/screens/details/components/cast_card.dart';

class CastCrew extends StatelessWidget {
  final List casts;

  const CastCrew({Key key, this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: kDefaultPadding / 2,
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding / 2),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) => CastCard(cast: casts[index]),
            ),
          )
        ],
      ),
    );
  }
}
