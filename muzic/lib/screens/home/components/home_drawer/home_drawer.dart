import 'package:flutter/material.dart';

import 'components/header/header.dart';
import 'components/menu/menu.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(),
          Menu(),
        ],
      ),
    );
  }
}
