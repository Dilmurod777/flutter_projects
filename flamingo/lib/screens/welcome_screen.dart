import 'package:flamingo/screens/home_screen.dart';
import 'package:flamingo/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bitmap.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: [
                  TextSpan(
                    text: 'flamin',
                  ),
                  TextSpan(
                    text: 'go.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundButton(
                text: 'start reading',
                fontSize: 20,
                verticalPadding: 30,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
