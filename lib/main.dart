import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = new QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

  //ans = qList[index].questionAns
  int index = 0;
  bool green = false, entered = false;

  void modifyScore(int index, bool green, bool entered) {
    if (entered) {
      //getQuestionAns(index)
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: "Finished",
                desc: "You have reached the end of the quiz.")
            .show();

        quizBrain.reset();
        setState(() {
          scorekeeper.clear();
        });
        // entered = false;
        // green = false;
      } else {
        if ((green && quizBrain.getQuestionAns() == true) ||
            (!green && quizBrain.getQuestionAns() == false)) {
          setState(() {
            scorekeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          });
        } else {
          setState(() {
            scorekeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    entered = true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                // ques[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                // foregroundColor: Colors.white,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                green = true;
                modifyScore(index, green, entered);
                quizBrain.nextQuestion();
                // index = (index + 1) % 12;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                green = false;
                modifyScore(index, green, entered);
                quizBrain.nextQuestion();
                // index = (index + 1) % 12;
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
