// import 'dart:html';
// import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_project/home.dart';

class result extends StatefulWidget {
  int marks;
  result({Key key, @required this.marks}) : super(key : key);

  @override 
  _resultState createState() => _resultState(marks);
}

class _resultState extends State<result> {

  List<String> images = [
    "images/good.png",
    "images/bad.png",
    "images/success.png"
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks < 20){
      image = image[1];
      message = "$marks\nYou can do better";
    }
    else if(marks < 50){
      image = image[0];
      message = "$marks\nCongratulations you did good";
    }
    else{
      image = image[2];
      message = "$marks\nCongratulations you passed";
    }
    super.initState();
  }

  int marks;
  _resultState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "Results", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Nunito"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
              child: Material(
                child: Container(
                  child: Column(children: <Widget>[
                    Material(
                      child: Container(
                        width: 400.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                            image,
                                ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0
                        )
                        ),
                        Center(child: Text(
                        message,
                          style: TextStyle(color: Colors.blue, fontFamily: "Nunito", fontWeight: FontWeight.w400, fontSize: 20.0)
                        ),)
                  ],)
              ),
            ),
          ),
          Expanded(
            flex: 4,
              child: MaterialButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                     builder: (context) => homePage(),
                  ));

                },
                child: Text(
                  "Continue", 
                  style: TextStyle(
                    fontSize: 18.0,fontWeight: FontWeight.w300 ,fontFamily: "Nunito", color: Colors.white
                    ),
                    maxLines: 1,
                  ),
                  color: Colors.blue,
                  splashColor: Colors.blueAccent,
                  highlightColor: Colors.blueAccent,
                  minWidth: 200.0,
                  height: 70.0,
                ),
            )
        ]
        ),
    );
  }
}