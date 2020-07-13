import 'package:flutter/material.dart';

class RightSearchBtn extends StatelessWidget {
  final Function toggleSearchFocusedHandler;

  const RightSearchBtn({Key key, this.toggleSearchFocusedHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggleSearchFocusedHandler();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 39,
        height: 39,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.search,
          size: 25,
          color: Color(0xFF131313),
        ),
      ),
    );
  }
}
