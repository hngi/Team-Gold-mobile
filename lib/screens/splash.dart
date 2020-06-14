import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizappteamgold/screens/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "Geek Tutor",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontFamily: "Balsamiq"
          ),
        ),
      ),
    );
  }
}
