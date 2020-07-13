import 'package:flutter/material.dart';

class LeftPersonBtn extends StatelessWidget {
  final bool showDetailedCount;
  final Function setShowDetailedCount;

  const LeftPersonBtn({
    Key key,
    this.setShowDetailedCount,
    this.showDetailedCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setShowDetailedCount(!showDetailedCount);
      },
      child: Container(
        width: 39,
        height: 39,
        margin: EdgeInsets.only(right: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.person,
          size: 25,
          color: Color(0xFF131313),
        ),
      ),
    );
  }
}
