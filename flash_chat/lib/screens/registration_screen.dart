import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';
import '../components/rounded_button.dart';
import '../components/error_modal.dart';
import '../screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 200.0,
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    final user = await _auth.currentUser();

                    if (newUser != null) {
                      emailController.clear();
                      passwordController.clear();
                      
                      Navigator.pushNamed(
                        context,
                        ChatScreen.id,
                        arguments: {'loggedInUser': user},
                      );
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (error) {
                    setState(() {
                      showSpinner = false;
                    });
                    String errorMessage = '';
                    switch (error.code) {
                      case 'ERROR_EMAIL_ALREADY_IN_USE':
                        errorMessage = "Email is already used!";
                        break;
                      case 'ERROR_INVALID_EMAIL':
                        errorMessage = "Email is incorrect!";
                        break;
                      default:
                        errorMessage = 'Undefined Error happened!';
                    }

                    ErrorModal(context: context, errorMessage: errorMessage);
                    print('ERROR occurred: $error');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
