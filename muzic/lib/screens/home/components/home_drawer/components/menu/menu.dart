import 'package:flutter/material.dart';
import 'package:muzic/screens/home/components/home_drawer/components/menu/components/menu_option/menu_option.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF10121D),
        padding: EdgeInsets.fromLTRB(20, 23, 6, 23),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MenuOption(icon: Icons.brush, title: 'themes'),
            MenuOption(icon: Icons.cut, title: 'ringtone cutter'),
            MenuOption(icon: Icons.timer, title: 'sleep timer'),
            MenuOption(icon: Icons.equalizer, title: 'equaliser'),
            MenuOption(icon: Icons.drive_eta, title: 'drive mode'),
            MenuOption(icon: Icons.folder, title: 'hidden folders'),
            MenuOption(icon: Icons.scanner, title: 'scan media'),
          ],
        ),
      ),
    );
  }
}
