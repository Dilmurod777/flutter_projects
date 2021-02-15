import 'package:flutter/material.dart';

Widget header(BuildContext context, {bool isAppTitle = false, String titleText, removeBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: !removeBackButton,
    title: Text(
      isAppTitle ? 'FlutterShare' : titleText,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: isAppTitle ? "Signatra" : '',
        fontSize: isAppTitle ? 50 : 22,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
