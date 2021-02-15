import 'package:flutter/material.dart';

import 'components/components/setting_option.dart';

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Column(
        children: [
          SettingsOption(icon: Icons.monitor, title: "display"),
          SettingsOption(icon: Icons.volume_up, title: "audio"),
          SettingsOption(icon: Icons.headset, title: "headset"),
          SettingsOption(icon: Icons.lock, title: "lockscreen"),
          SettingsOption(icon: Icons.list, title: "advanced"),
          SettingsOption(icon: Icons.settings, title: "other"),
        ],
      ),
    );
  }
}
