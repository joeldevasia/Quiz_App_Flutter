import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank questionBank = QuestionBank();

void main() => runApp(const QuizPage());

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: QuizApp(),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> score = [];

  void alertPopUp() {
    Alert(
        context: context,
        type: AlertType.success,
        title: 'Quiz Completed',
        desc: 'You have successfully completed the quiz',
        buttons: [
          DialogButton(
            onPressed: () {
              setState(() {
                questionBank.reset();
                score.clear();
              });
              Navigator.pop(context);
            },
            color: Colors.green,
            child: const Text(
              'Reset',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          DialogButton(
            onPressed: () {
              SystemNavigator.pop();
              // exit(0);
            },
            color: Colors.red,
            child: const Text(
              'Exit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ]).show();
  }

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (score.length < questionBank.getLength()) {
        if (userAnswer == questionBank.getAnswer()) {
          score.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBank.nextQuestion();
      } else {
       alertPopUp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  questionBank.getQuestion(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    'True',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
