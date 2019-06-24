import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/services/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sharedUI/shared.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    auth.getUser.then((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(
            size: 150,
          ),
          Text(
            'Login to Start',
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center,
          ),
          Text('Your Tagline'),
          LoginButton(
            text: 'LOGIN WITH GOOGLE',
            icon: FontAwesomeIcons.google,
            color: Colors.black45,
            loginMethod: auth.googleSignIn,
          ),
          LoginButton(
            text: 'Continue as Guest',
            loginMethod: auth.anonLogin,
          )
        ],
      ),
    ));
  }
}
