import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsOption({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(22, 0, 20, 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFFDA549B), size: 25),
            SizedBox(width: 30),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.07),
                    ),
                  ),
                ),
                child: Text(
                  title[0].toUpperCase() + title.substring(1),
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
