import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_project/home.dart';

class splashsreen extends StatefulWidget {
  @override
  
  _splashsreenState createState() => _splashsreenState();
}

class _splashsreenState extends State<splashsreen> {
  @override
  void initstate(){
    super.initState();
    Timer(Duration(seconds: 2),(){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => homePage()
              ));
            });
          }
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text(
                  "Quizzes", style: TextStyle(fontFamily: "Quantify", fontSize : 50.0, color: Colors.blue, letterSpacing: 200.0),
               ),
              ),
            );
          }
    }