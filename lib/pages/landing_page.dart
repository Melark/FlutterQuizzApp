import "package:flutter/material.dart";
import 'quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Quizzzzz", style: new TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
            new Text("Tap to Start", style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white70
            ),)
          ],
        ),
      ),
    );
  }
}
