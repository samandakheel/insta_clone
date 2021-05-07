import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';
import 'pages/splash_screen.dart';
import 'pages/timeline_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instgram clone ',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/timeline': (context) => TimeLinePage(),
      },
    );
  }
}
