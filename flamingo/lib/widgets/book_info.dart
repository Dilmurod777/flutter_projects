import 'package:flamingo/constraints.dart';
import 'package:flamingo/widgets/book_rating.dart';
import 'package:flamingo/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Crushing &',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Influence',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'When the earth was flat and everyone wanted to win the game of the best and people and winning with an A game with all the things you have.',
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 10,
                            color: kLightBlackColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        RoundButton(
                          text: 'Read',
                          verticalPadding: 16,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      BookRating(score: 4.9),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Image.asset(
          'assets/images/book-1.png',
          height: 180,
        )
      ],
    );
  }
}
