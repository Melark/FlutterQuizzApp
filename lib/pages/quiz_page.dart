import 'package:flutter/material.dart';
import '../utils/quiz.dart';
import '../utils/question.dart';

import '../UI/question_text.dart';
import '../UI/answer_button.dart';

import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("An ostrich's eye is bigger than its brain.", true),
    new Question("The actor who played the father on Family Matters also voiced Shredder in the '80s-'90s TMNT cartoon.", false),
    new Question("Taco Bell is named after its founder, Glen Bell.	", true),
    new Question("The average 10-gallon hat only holds about three quarts.	", true),
    new Question("The real name of Scooby-Doo's 'Shaggy' is Lester Martindale.", false),
    new Question("The phrase 'O.M.G.' was used in 1917 in a letter to Winston Churchill.", true),
    new Question("Toyota has announced that the official plural of 'Prius' is 'Priuses'.", false),
    new Question("A duck's quack doesn't echo.", false),
    new Question("A jellyfish is 95 percent water.", true),
    new Question("When David Hasselhoff divorced, he lost possession of the catchphrase 'Don't Hassle the Hoff'.", false),
    new Question("Before Google launched Gmail, 'G-Mail' was the name of a free email service offered by Garfield's website.", true),
    new Question("Bubble gum contains rubber.", true),
    new Question("Melandri van Rensburg is the prettiest person in the whole entire world", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    print(answer);
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayVisible == true
            ? new CorrectWrongOverlay(isCorrect, () {
                if (quiz.questionCount == questionNumber )
                {
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.questionCount)), (Route route) => route == null);
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : new Container()
      ],
    );
  }
}
