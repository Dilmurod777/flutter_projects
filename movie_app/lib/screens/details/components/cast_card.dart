import 'package:flutter/material.dart';

import '../../../constraints.dart';


class CastCard extends StatelessWidget {
  final Map cast;

  const CastCard({Key key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            "${cast['orginalName']}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            "${cast['movieName']}",
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextLightColor),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
