import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insta_clone/auth/auth.dart';

class SplashScreen extends StatelessWidget {
  final AuthRepo _authRepo = AuthRepo.instance;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      if (_authRepo.giveCurrentUser == null) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        Navigator.of(context).pushReplacementNamed('/timeline');
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/instagram_logo.png',
                // fit: BoxFit.cover,
                width: 150.0,
                height: 150.0,
              ),
            ),
            Align(
              child: Text(
                'HELLO',
                style: TextStyle(
                  fontSize: 38.0,
                  color: Color(0xff888888),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
