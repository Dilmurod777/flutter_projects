import 'package:flamingo/constraints.dart';
import 'package:flutter/material.dart';

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function press;

  const ChapterCard({
    Key key,
    this.name,
    this.tag,
    this.chapterNumber,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(0.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Chapter $chapterNumber : $name \n',
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: tag,
                  style: TextStyle(color: kLightBlackColor),
                )
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward, size: 18),
            onPressed: press,
          )
        ],
      ),
    );
  }
}
