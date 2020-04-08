import 'package:animal_planet/common/custom_appbar.dart';
import 'package:animal_planet/utils/strings.dart';
import 'package:animal_planet/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFB98959),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.4,
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/elephant.jpg",
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: <Widget>[
                      CustomAppBar(opacity: 1),
                      Expanded(
                        child: Align(
                          alignment: Alignment(0, -0.9),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              Strings.welcomeToAPlanet,
                              style: TextStyles.dashboardH1TextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.725,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                color: Color(0xFFB98959),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      Strings.relatedToYou,
                      style: TextStyles.h2TextStyle,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: width * 0.5,
                            margin: EdgeInsets.only(left: 20, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      "assets/tiger.jpg",
                                      fit: BoxFit.cover,
                                      width: width * 0.5,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    Strings.lifeWithATiger,
                                    style: TextStyles.h2TextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    Strings.loremIpsum,
                                    style: TextStyles
                                        .categoriesSliderDescTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.5,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      "assets/wild_animals.jpeg",
                                      width: width * 0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    Strings.lifeWithATiger,
                                    style: TextStyles.h2TextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    Strings.loremIpsum,
                                    style: TextStyles
                                        .categoriesSliderDescTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                      top: 0,
                    ),
                    child: Text(
                      Strings.quickCategories,
                      style: TextStyles.titleTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFF8C5835),
                              ),
                              child: Image.asset(
                                "assets/bear.png",
                                height: 35,
                                width: 35,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(Strings.bear,
                                style: TextStyles.categoriesDescTextStyle)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFF8C5835),
                              ),
                              child: Image.asset(
                                "assets/lion.png",
                                height: 35,
                                width: 35,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(Strings.lion,
                                style: TextStyles.categoriesDescTextStyle)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFF8C5835),
                              ),
                              child: Image.asset(
                                "assets/reptiles.png",
                                height: 35,
                                width: 35,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(Strings.reptiles,
                                style: TextStyles.categoriesDescTextStyle)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFF8C5835),
                              ),
                              child: Image.asset(
                                "assets/pets.png",
                                height: 35,
                                width: 35,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(Strings.pets,
                                style: TextStyles.categoriesDescTextStyle)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
