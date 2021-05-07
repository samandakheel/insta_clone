import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_clone/auth/auth.dart';
import 'package:insta_clone/widgets/myflatButton.dart';
import 'package:insta_clone/widgets/mytextfield.dart';

class LoginPage extends StatefulWidget {
  final AuthRepo _authRepo = AuthRepo.instance;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/insta_logo2.png',
                  height: 50,
                  width: 150,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: MyTextField(
                    hint: "Email",
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: MyTextField(
                    hint: "Password ",
                    isPassword: true,
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 32.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF0086EC),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: MyTextButton(
                    'Login',
                    onPressed: () {
                      login();
                      Navigator.of(context).popAndPushNamed('/timeline');
                    },
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: MyTextButton(
                    'Singup',
                    onPressed: () {
                      register();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  register() async {
    try {
      String uid = await widget._authRepo.register(_email, _password);
      showSnacBar("You SignUp succefully ");
      return uid;
    } on PlatformException catch (e) {
      showSnacBar(e.message);
    }
  }

  login() async {
    try {
      String uid = await widget._authRepo.login(_email, _password);
      Navigator.of(context).pushReplacementNamed('/timeline');
      return uid;
    } on PlatformException catch (e) {
      showSnacBar(e.message);
    }
  }

  showSnacBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
