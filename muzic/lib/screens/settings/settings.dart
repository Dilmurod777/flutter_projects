import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';

import 'components/settings_body/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: (){
            eventBus.fire(DrawerEvent(true));
          },
          child: Icon(
            Icons.view_headline,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SettingsBody(),
    );
  }
}
