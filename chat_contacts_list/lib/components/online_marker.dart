import 'package:flutter/material.dart';

class OnlineMarker extends StatelessWidget {
  final bool isLarge;

  const OnlineMarker({Key key, this.isLarge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        width: isLarge ? 18 : 15,
        height: isLarge ? 18 : 15,
        alignment: Alignment.center,
        decoration:
        BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Container(
          width: isLarge ? 10.12 : 8.48,
          height: isLarge ? 10.17 : 8.48,
          decoration: BoxDecoration(
              color: Color(0xFF719CF8), shape: BoxShape.circle),
        ),
      ),
    );
  }
}
