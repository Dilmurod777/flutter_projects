import 'package:flutter/material.dart';

import '../utils/text_styles.dart';
import '../widgets/bottom_navbar.dart';

class CookieDetailsScreen extends StatelessWidget {
  final String assetPath, cookiePrice, cookieName;

  CookieDetailsScreen({
    this.assetPath,
    this.cookieName,
    this.cookiePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pickup',
          style: kAppBarTitleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xFF545D38),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Cookie', style: kDetailsTitleTextStyle),
          ),
          SizedBox(height: 15.0),
          Hero(
            tag: assetPath,
            child: Image.asset(
              assetPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20.0),
          Center(child: Text(cookiePrice, style: kDetailsPriceTextStyle)),
          SizedBox(height: 10.0),
          Center(child: Text(cookieName, style: kDetailsNameTextStyle)),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                'Cold, creamy ice cream sandwitched between delicious deluxe cookies. Pick your favourite deluxe cookies and ice cream flavor.',
                style: kDetailsDescTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFFF17532),
              ),
              child: Center(
                child: Text('Add to cart', style: kDetailsAddToCartTextStyle),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF17533),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
    );
    ;
  }
}
