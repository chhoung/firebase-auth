import 'package:firebaselogin/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text('Sign out'),
        onPressed: () async {
          await authService.signOut();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
      )),
    );
  }
}
