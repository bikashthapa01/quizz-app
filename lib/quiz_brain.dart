import 'package:quiz_app/question.dart';

class QuizBrain {
  int _currentQuestion = 0;
  final List<Question> _questions = [
    Question(title: 'Mount Everest is located in Nepal.', answer: true),
    Question(
        title: 'The total area of Nepal is 147,516 Square KM.', answer: false),
    Question(
        title: 'Nepal is not a smallest country in the world.', answer: true)
  ];

  String getQuestion() {
    return _questions[_currentQuestion].title;
  }

  bool getCorrectAnswer() {
    return _questions[_currentQuestion].answer;
  }

  bool isFinished() {
    if (_currentQuestion >= _questions.length - 1) {
      _currentQuestion = 0;
      return true;
    }
    return false;
  }

  void getNextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      _currentQuestion++;
    }
  }
}
