import 'package:flutter/material.dart';
import 'package:meditation/widgets/bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonNavItem(
            title: 'Today',
            svgSrc: 'assets/icons/calendar.svg',
          ),
          ButtonNavItem(
            title: 'All Exercises',
            svgSrc: 'assets/icons/gym.svg',
            isActive: true,
          ),
          ButtonNavItem(
            title: 'Settings',
            svgSrc: 'assets/icons/Settings.svg',
          ),
        ],
      ),
    );
  }
}
