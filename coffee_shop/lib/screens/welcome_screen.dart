import 'package:flutter/material.dart';

import '../widgets/coffee_list_card.dart';
import '../widgets/build_image.dart';
import '../utils/text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), title: Text('Orders')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text('Favourites')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text('Profile')),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15.0),
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Welcome, Jessica',
                style: kWelcomeTitleTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage('assets/img/model.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(right: 45.0),
            child: Container(
              child: Text(
                'Let\'s select the best taste for your next coffee break!',
                style: kSelectCoffeeTextStyle,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Taste of the week',
                style: kTasteOfWeekTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'See all',
                  style: kSeeAllTextStyle,
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Container(
            height: 410,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CoffeeListCard(
                  image: 'assets/img/starbucks.png',
                  title: 'Caffe Misto',
                  location: 'Coffeeshop',
                  desc:
                      'Our dark, rich espresso balanced with steamed milk and a light layer of foam',
                  price: '\$4.99',
                  favourite: false,
                ),
                CoffeeListCard(
                  image: 'assets/img/starbucks.png',
                  title: 'Caffe Latte',
                  location: 'BrownHouse',
                  desc:
                      'Rich, full-bodied espresso with bittersweet milk sause and steamed milk',
                  price: '\$3.99',
                  favourite: false,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Explore nearby',
                style: kExploreNearbyTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'See all',
                  style: kSeeAllTextStyle,
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Container(
            height: 125.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                BuildImage(image: 'assets/img/coffee.jpg'),
                BuildImage(image: 'assets/img/coffee2.jpg'),
                BuildImage(image: 'assets/img/coffee3.jpg'),
              ],
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
