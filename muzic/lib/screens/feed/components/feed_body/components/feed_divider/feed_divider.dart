import 'package:flutter/material.dart';

class FeedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      child: Divider(height: 1, color: Colors.white.withOpacity(0.07)),
    );
  }
}
