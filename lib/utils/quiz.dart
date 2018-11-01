import './question.dart';

class Quiz{
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score;

  Quiz(this._questions){
    _questions.shuffle();
  }

  int get score => _score;
  List<Question> get questions => _questions;
  int get questionCount => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  
  Question get nextQuestion {
    _currentQuestionIndex++;

    if (_currentQuestionIndex >= questionCount) return null;

    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect){
    if (isCorrect) _score++;
  }
}