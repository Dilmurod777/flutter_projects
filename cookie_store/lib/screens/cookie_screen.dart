import 'package:flutter/material.dart';

import '../widgets/build_card.dart';

class CookieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                BuildCard(
                  name: 'Cookie mint',
                  price: '\$3.99',
                  image: 'assets/img/cookiemint.jpg',
                  added: false,
                  isFavourite: false,
                  context: context,
                ),
                BuildCard(
                  name: 'Cookie cream',
                  price: '\$5.99',
                  image: 'assets/img/cookiecream.jpg',
                  added: true,
                  isFavourite: false,
                  context: context,
                ),
                BuildCard(
                  name: 'Cookie classic',
                  price: '\$1.99',
                  image: 'assets/img/cookieclassic.jpg',
                  added: false,
                  isFavourite: true,
                  context: context,
                ),
                BuildCard(
                  name: 'Cookie choco',
                  price: '\$2.99',
                  image: 'assets/img/cookiechoco.jpg',
                  added: false,
                  isFavourite: false,
                  context: context,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
