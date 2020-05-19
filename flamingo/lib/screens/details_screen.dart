import 'package:flamingo/constraints.dart';
import 'package:flamingo/widgets/book_info.dart';
import 'package:flamingo/widgets/book_rating.dart';
import 'package:flamingo/widgets/chapter_card.dart';
import 'package:flamingo/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: size.height * 0.1),
                        BookInfo(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.4 + 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ChapterCard(
                        name: 'Money',
                        chapterNumber: 1,
                        tag: 'Life is about change',
                        press: () {},
                      ),
                      ChapterCard(
                        name: 'Power',
                        chapterNumber: 2,
                        tag: 'Everything loves power',
                        press: () {},
                      ),
                      ChapterCard(
                        name: 'Influence',
                        chapterNumber: 3,
                        tag: 'Influence easily like never before',
                        press: () {},
                      ),
                      ChapterCard(
                        name: 'Win',
                        chapterNumber: 4,
                        tag: 'Winning is what matters',
                        press: () {},
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                        TextSpan(text: 'You might also '),
                        TextSpan(
                          text: 'like...',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            padding: EdgeInsets.only(
                              left: 24,
                              top: 24,
                              right: 150,
                            ),
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                              color: Color(0xFFFFF8F9),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: kBlackColor),
                                    children: [
                                      TextSpan(
                                        text:
                                            'How To Win Friends & Influence \n',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      TextSpan(
                                        text: 'Gary Venchuk',
                                        style: TextStyle(
                                          color: kLightBlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    BookRating(score: 4.9),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: RoundButton(
                                        text: 'Read',
                                        verticalPadding: 10,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/book-3.png',
                          width: 150,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
