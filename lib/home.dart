import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quizappteamgold/quizpage.dart';

class homepage extends StatefulWidget {

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images =  [
    "images/py.png",
    "images/java.png",
    "images/js.png",
    "images/cpp.png",
  ];


  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
  ];


  Widget customcard(String langname, String image, String desc){
    return Padding(
      padding: EdgeInsets.all(


        20.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                          image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: "Alike"
                  ),
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App by Team Gold",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        )
      ),
      body: ListView(
        children: <Widget>[
          customcard("Python", images[0], des[0]),
          customcard("Java", images[1], des[1]),
          customcard("JavaScript", images[2], des[2]),
          customcard("C++", images[3], des[3]),
        ],
      ),
    );
  }
}
