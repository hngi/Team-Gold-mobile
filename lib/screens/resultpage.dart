import 'package:flutter/material.dart';
import 'package:quizappteamgold/screens/home.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/success.jpeg",
    "images/good.jpeg",
    "images/bad.jpeg",
  ];

  String message1;
  String message2;
  String image;
  Color myColor;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message1 = "You Scored $marks";
      message2 = "You have a long way to go..";
      myColor = Color.fromRGBO(190, 56, 55, 1.0);
    } else if (marks < 35) {
      image = images[1];
      message1 = "You Scored $marks";
      message2 = "Try harder...";
      myColor = Colors.blueGrey;
    } else {
      image = images[0];
      message1 = "You Scored $marks";
      message2 = "You are good...";
      myColor = Colors.green;
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        centerTitle: true,
        backgroundColor: myColor,
        title: Text(
          message1,
          style: TextStyle(
            fontFamily: "Balsamiq",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
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
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          message2,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: myColor,
                            fontFamily: "Balsamiq",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "Balsamiq",
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: myColor),
                  splashColor: myColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
