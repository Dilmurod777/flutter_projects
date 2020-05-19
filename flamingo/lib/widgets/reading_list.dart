import 'package:flamingo/screens/details_screen.dart';
import 'package:flamingo/widgets/reading_list_card.dart';
import 'package:flutter/material.dart';

class ReadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ReadingListCard(
            image: 'assets/images/book-1.png',
            title: 'Crushing & Influence',
            auth: 'Gary Venchuk',
            rating: 4.9,
            pressDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen();
                  },
                ),
              );
            },
          ),
          ReadingListCard(
            image: 'assets/images/book-2.png',
            title: 'Top Ten Business Hacks',
            auth: 'Herman Joel',
            rating: 4.8,
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
