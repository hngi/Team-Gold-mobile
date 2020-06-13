import 'dart:async';
import 'dart:convert';
// import 'dart:html';
// import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_project/result.dart';

class usejson extends StatelessWidget {

//  List<String> asset = [
//    "assets/Java.json",
//    "assets/Python.json",
//    "assets/Html.json",
//    "assets/Cpp.json",
//    "assets/Javascript.json",
//  ];

  String langname;
  usejson(this.langname);
  String assettoload;

  setasset() {
    if (langname == "Python") {
      assettoload = "assets/python.json";
    } else if (langname == "Java") {
      assettoload = "assets/java.json";
    } else if (langname == "Javascript") {
      assettoload = "assets/js.json";
    } else if (langname == "C++") {
      assettoload = "assets/cpp.json";
    } else {
      assettoload = "assets/Html.json";
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot){
        List data = json.decode(snapshot.data.toString());
        if (data == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading...", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue, ),
              maxLines: 1,
            ),)
          );
        }
        else{
          return quiz(data : data);
        }
      },
    );
  }
}


class quiz extends StatefulWidget {
  var data;
  quiz({Key key, @required this.data}) : super(key : key);

  @override
  _quizState createState() => _quizState(data);
}


class _quizState extends State<quiz> {

  var data;
  _quizState(this.data);
  Color colorToShow = Colors.white;
  Color incorrect = Colors.redAccent;
  Color correct = Colors.greenAccent;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";
 
  Map<String, Color> buttonColor = {
    "a": Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white,
  };

  bool cancelTimer = false;


  @override
  void initState(){
    startTimer();
    super.initState();
  }

  @override
  void startTimer() async {
    const sec = Duration(seconds: 1);

    Timer.periodic(sec, (Timer t){
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        }
        else if(cancelTimer == true){
          t.cancel();
        }
        else{
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }



  void nextQuestion(){
    timer = 30;
    setState(() {
      if (i < 5) {
      i++;
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => result(marks : marks)));
    }
    buttonColor["a"] = Colors.white;  
    buttonColor["b"] = Colors.white;
    buttonColor["c"] = Colors.white;
    buttonColor["d"] = Colors.white;
    });
    startTimer();
  }



  void checkAnswer(String answer){
    if (data  [2]["1"] == data[1]["1"][answer]) {
      marks = marks + 10;
      colorToShow = correct;
    }
    else{
      colorToShow = incorrect;
    }
    setState(() {
      buttonColor[answer] = colorToShow;
      cancelTimer = true;
    });
    Timer(Duration(seconds: 2), nextQuestion);
  }





  Widget choicebutton(String answer){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0
        ),
        child: MaterialButton(
          onPressed: () => checkAnswer(answer),
          child: Text(data[1][i.toString()][answer], style: TextStyle(fontFamily: "Nunito", fontSize: 16.0, fontWeight: FontWeight.w600), 
          maxLines: 1,
          ),
          color: buttonColor[answer],
          splashColor: Colors.white10,
          highlightColor: Colors.white10,
          minWidth: 600.0,
          height: 70.0,
          ),
    );
  }



  @override
  Widget build(BuildContext context){
  //  SystemChrome.setPreferredOrientations([
  //    DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
  //    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Quizzes",
              ), 
            content: Text("You haven't finished your quiz, you can't leave now"),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),)
            ]
            ),
          );
      },
      child: Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              data[0][i.toString()],
              style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w300,fontFamily: "Nunito"
              ),
            ),
            ),  
        ),
        Expanded(
          flex: 6,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                choicebutton("a"),
                choicebutton("b"),
                choicebutton("c"),
                choicebutton("d"),
              ],
              ),
            ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topLeft,
            child: Center(
              child: Text(
                showTimer,
                style: TextStyle(fontWeight: FontWeight.w800, fontFamily: "Nunito")
              ),
            ),
        ),
      )])
    ),);
  }
}