import 'package:flutter/material.dart';
import '../utils/quiz.dart';
import '../utils/question.dart';

import '../UI/question_text.dart';
import '../UI/answer_button.dart';

import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
         new Column(
         children: <Widget>[
          new AnswerButton(true, () => print("true")),
          new QuestionText("LALALA",0),
          new AnswerButton(false,() => print("true"))
        ],
       ),
       new CorrectWrongOverlay(false)
      ],
    );
  }
} 