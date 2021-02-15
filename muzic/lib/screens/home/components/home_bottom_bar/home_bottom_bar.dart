import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  final int currentPage;
  final Function onPageChange;

  const HomeBottomBar({
    Key key,
    @required this.currentPage,
    @required this.onPageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onPageChange,
      currentIndex: currentPage,
      backgroundColor: Color(0xFF151827),
      iconSize: 25,
      selectedItemColor: Color(0xFFD9519D),
      unselectedItemColor: Colors.white.withOpacity(0.28),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: "Songs",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
