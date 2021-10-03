import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizz());
}

class Quizz extends StatelessWidget {
  const Quizz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quiz App",
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoresKeeper = [];
  int currentQuestion = 0;

  void checkAnswer(bool userSelectedAnswer) {
    if (userSelectedAnswer == quizBrain.getCorrectAnswer()) {
      scoresKeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoresKeeper.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    setState(() {
      if (quizBrain.isFinished()) {
        scoresKeeper = [];
        Alert(
          context: context,
          title: "Finished!",
          desc: "You have Answered all the questions.",
        ).show();
      } else {
        quizBrain.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              quizBrain.getQuestion(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: const Text(
                      "True",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: const Text(
                      "False",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: scoresKeeper,
            ),
          ],
        ),
      ),
    );
  }
}
