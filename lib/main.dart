import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() { 
  return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  String _mainText ='''In the world of technology, there are alot of programming languages which are of great importance and use.
   I won\'t say they are simple but there are simpler languages to learn for a start.''';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text('PROGRAMMING QUIZ APP'),
         ),
         body: Column(children: [Row(children:[RaisedButton( onPressed: () {setState((){_mainText = ''' The programming language that's best 
          to learn depends on the purpose which you want to the use the language for.''';});}, child: Text('''Second Page''')),
           RaisedButton(onPressed: () { setState ((){_mainText = ''' Let's define a programming language. It is a coded language that is used 
           by human beings to write instructions to the computer effectively. Simply a its a means of communication betwwen humans and computers''';}) ;}, child: Text('Third Page')),
           RaisedButton(onPressed: () { setState ((){_mainText = '''Examples of programming languages-
           ;C language: building blocks for many other languages.;
           C++ : well suited for large projects(game programming);Java: multi-platform language useful in netwiorking. Check the internet for more
           ''';}) ;}, child: Text('Fourth Page')),
           ]),
           
           Center(child: Text(_mainText))
         ])
    ));
  }
}


