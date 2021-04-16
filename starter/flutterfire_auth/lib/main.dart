import 'package:flutter/material.dart';
import 'package:flutterfire_auth/ui/home.dart';
import 'package:flutterfire_auth/ui/sign_in.dart';
import 'package:flutterfire_auth/ui/sign_up.dart';
import 'package:flutterfire_auth/ui/splash.dart';

Future<void> main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Firebase Auth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.indigoAccent,
          scaffoldBackgroundColor: Color(0xFFf7f7f7),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Home(),
        },
      );
  }
}
