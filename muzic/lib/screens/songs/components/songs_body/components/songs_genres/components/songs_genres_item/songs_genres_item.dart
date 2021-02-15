import 'package:flutter/material.dart';

class SongsGenresItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.width - 2 * 20 - 10) / 2;

    return InkWell(
      onTap: () {},
      child: Container(
        width: size,
        height: size * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Genres/1.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.hardLight,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Classical',
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '56 Songs',
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
