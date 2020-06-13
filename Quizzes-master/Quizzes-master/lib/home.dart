// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_project/quiz.dart';

class homePage extends StatefulWidget {
  @override
  homePageState createState() => homePageState();
}

class homePageState extends State<homePage> {

  List<String> images = [
    "images/java.png"
    "images/py.png"
    "images/Html.png"
    "images/js.png"
    "images/cpp.png"
  ];


  Widget customcard(String langname, String image){
    return Padding(
      padding: EdgeInsets.all(
        20.0, 
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => usejson(langname),
            ));
        },
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Material(
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(
                          image
                        ),
                      ),
                    ),
                  ),
                ), 
              ),
              Center(child: Text(
                langname,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Test your skills in $langname.",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w300,
                    color: Colors.blueAccent
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override 
  Widget build(BuildContext context) {
  //  SystemChrome.setPreferredOrientations([
  //    DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
  //  ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quizzes', 
          style: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Java", images[0]),
          customcard("Python", images[1]),
          customcard("HTML", images[2]),
          customcard("Javasctipt", images[3]),
          customcard("C++", images[4]),
        ],
      ),
    );
  }
}