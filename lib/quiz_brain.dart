import 'package:quiz_app/question.dart';

class QuizBrain {
  int _currentQuestion = 0;
  final List<Question> _questions = [
    Question(q: 'Mount Everest is located in Nepal.', a: true),
    Question(q: 'The total area of Nepal is 147,516 Square KM.', a: false),
    Question(q: 'Nepal is not a smallest country in the world.', a: true)
  ];

  String getQuestion() {
    return _questions[_currentQuestion].title;
  }

  bool getCorrectAnswer() {
    return _questions[_currentQuestion].answer;
  }

  bool isFinished() {
    int questionLength = _questions.length;
    print(_currentQuestion);
    print('Length: $questionLength');
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
