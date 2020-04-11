import 'package:flutter/material.dart';

import '../screens/details_screen.dart';
import '../utils/text_styles.dart';

class CoffeeListCard extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final String location;
  final String price;
  final bool favourite;

  CoffeeListCard({
    @required this.image,
    @required this.title,
    @required this.desc,
    @required this.location,
    @required this.price,
    @required this.favourite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: 300.0,
        width: 225.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 335.0,
                ),
                Positioned(
                  top: 75,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    height: 260,
                    width: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFDAB68C),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 60.0),
                        Text(
                          location + '\'s',
                          style: kCardLocationTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          title,
                          style: kCardTitleTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          desc,
                          style: kCardDescriptionTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              price,
                              style: kCardPriceTextStyle,
                            ),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: favourite ? Colors.red : Colors.grey,
                                  size: 15.0,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 60.0,
                  top: 25.0,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen()));
              },
              child: Container(
                height: 50.0,
                width: 225.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xFF473D3A),
                ),
                child: Center(
                  child: Text(
                    'Order now',
                    style: kMakeOrderTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
