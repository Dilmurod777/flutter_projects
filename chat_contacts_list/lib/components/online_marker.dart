import 'package:flutter/material.dart';

class OnlineMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        width: 18,
        height: 18,
        alignment: Alignment.center,
        decoration:
        BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Container(
          width: 10.12,
          height: 10.17,
          decoration: BoxDecoration(
              color: Color(0xFF719CF8), shape: BoxShape.circle),
        ),
      ),
    );
  }
}
