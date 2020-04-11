import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../widgets/build_ingredient_item.dart';
import '../utils/text_styles.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 20,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFF3B2B7),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2 - 20.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15,
                  child: Container(
                    height: (MediaQuery.of(context).size.height / 2) - 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: <Widget>[
                        Text(
                          'Preparation time',
                          style: kPreparationTimeTextStyle,
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          '5min',
                          style: kNumberOfMinTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color(0xFFC6C4C4),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Ingredients',
                          style: kIngredientsTextStyle,
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 110.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              BuildIngredientItem(
                                name: 'Water',
                                icon: Icon(
                                  Feather.droplet,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                bgColor: Color(0xFF6FC5DA),
                              ),
                              BuildIngredientItem(
                                name: 'Brewed Espresso',
                                icon: Icon(
                                  Feather.target,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                bgColor: Color(0xFF615955),
                              ),
                              BuildIngredientItem(
                                name: 'Sugar',
                                icon: Icon(
                                  Feather.box,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                bgColor: Color(0xFFF39595),
                              ),
                              BuildIngredientItem(
                                name: 'Toffee Nut Syrup',
                                icon: Icon(
                                  MaterialCommunityIcons.peanut_outline,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                bgColor: Color(0xFF8FC28A),
                              ),
                              BuildIngredientItem(
                                name: 'Natural Flavers',
                                icon: Icon(
                                  MaterialCommunityIcons.leaf_maple,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                bgColor: Color(0xFF3B8079),
                              ),
                              BuildIngredientItem(
                                name: 'Vanilla Syrup',
                                icon: Icon(
                                  MaterialCommunityIcons.flower_tulip,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                bgColor: Color(0xFFF8B870),
                              ),
                              SizedBox(width: 25.0),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color(0xFFC6C4C4),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Nutrition Information',
                          style: kNutritionInformationTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text('Calories', style: kNutritionTextTextStyle),
                            SizedBox(width: 15.0),
                            Text('250', style: kNutritionValueTextStyle),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text('Proteins', style: kNutritionTextTextStyle),
                            SizedBox(width: 15.0),
                            Text('10g', style: kNutritionValueTextStyle),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text('Caffeine', style: kNutritionTextTextStyle),
                            SizedBox(width: 15.0),
                            Text('150mg', style: kNutritionValueTextStyle),
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color(0xFFC6C4C4),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Color(0xFF473D3A),
                            ),
                            child: Center(
                              child: Text(
                                'Make Order',
                                style: kMakeOrderTextStyle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  left: 75.0,
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/pinkcup.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25.0,
                  left: 15.0,
                  child: Container(
                    height: 300.0,
                    width: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Text(
                                'Caramel Macchiato',
                                style: kDetailScreenTitleTextStyle,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 170.0,
                          child: Text(
                            'Freshly steamed milk with vanilla-flavored syrup is marked with espresso and topped with caramel drizzle for an oh-so-sweet finish.',
                            style: kDetailsScreenDescrTextStyle,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xFF473D3A),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '4.2',
                                      style:
                                          kDetailsScreenCurrentRatingTextStyle,
                                    ),
                                    Text(
                                      '/5',
                                      style: kDetailsScreenTotalRatingTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 80.0,
                                      height: 35.0,
                                    ),
                                    Positioned(
                                      left: 40.0,
                                      height: 35.0,
                                      width: 35.0,
                                      child: Container(
                                        height: 35.0,
                                        width: 35.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                          border: Border.all(
                                            color: Color(0xFFF3B2B7),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/img/man.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20.0,
                                      child: Container(
                                        height: 35.0,
                                        width: 35.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                          border: Border.all(
                                            color: Color(0xFFF3B2B7),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/img/model.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0.0,
                                      child: Container(
                                        height: 35.0,
                                        width: 35.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                          border: Border.all(
                                            color: Color(0xFFF3B2B7),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/img/model2.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 3.0),
                                Text(
                                  '+ 27 more',
                                  style: kMoreTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
