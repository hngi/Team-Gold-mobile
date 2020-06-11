import 'package:flutter/material.dart';
import 'package:quizappteamgold/screens/home.dart';
import 'package:quizappteamgold/screens/quizpage.dart';
import 'package:quizappteamgold/screens/resultpage.dart';
import 'package:quizappteamgold/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Gold Quiz App',
      theme: ThemeData(
        fontFamily: 'Balsamiq',
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(37, 44, 74, 1.0),
        primaryColor: Color.fromRGBO(190, 56, 55, 1.0),
      ),
      routes: {
        'home': (context) => homepage(),
        'quiz': (context) => quizpage(),
        'result': (context) => resultpage(),
      },
      home: splashscreen(),
    );
  }
}
