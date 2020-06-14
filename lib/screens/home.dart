import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quizappteamgold/screens/quizpage.dart';
import 'package:quizappteamgold/components/custom_button.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "images/py.png",
    "images/java.png",
    "images/js.png",
    "images/cpp.png",
  ];

  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful!",
  ];

  Widget customcard(String langname, String image, String desc) {
    Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(
        30.0,
      ),
      child: InkWell(
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          borderOnForeground: true,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    child: Container(
                      height: screen.width / 3,
                      width: screen.width / 3,
                      child: Image(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.cover,
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
                      fontFamily: "Balsamiq",
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
                        fontFamily: "Balsamiq"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => getjson(langname),
                      ));
                    },
                    child: CustomButton(text: 'Take test'),
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        centerTitle: true,
        title: Text(
          "Geek Tutor",
          style: TextStyle(
            fontFamily: "Balsamiq",
          ),
        ),
        backgroundColor: Colors.indigoAccent,
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
