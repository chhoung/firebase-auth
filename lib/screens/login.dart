import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebaselogin/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                print('signing with google');

                var user = await auth.googleSignin();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              padding: EdgeInsets.all(30.0),
              label: Text('Sign in with google'),
              icon: Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              color: Colors.black45,
            ),
            SizedBox(
              height: 30.0,
            ),
            FlatButton.icon(
              onPressed: () async {
                print('signing in as anonymous');

                var anonUser = await auth.anonSignIn();
                if (anonUser != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              padding: EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
              ),
              icon: Icon(FontAwesomeIcons.male),
              label: Text('Login as anonymous'),
              color: Colors.black45,
            )
          ],
        ),
      ),
    );
  }
}
