import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(this.submit, this.questions, this.rightAnswer,
      {super.key});
  final List<List<String>> questions;
  final List<int> rightAnswer;
  final void Function(int ans) submit;
  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  late int currQuestion;
  late List<List<String>> questions;
  late List<int> rightAnswer;
  List<int> actualAnswers = [];

  List<Widget> buildAnswers() {
    List<Widget> answers = [];
    answers.add(
      Text(
        questions[currQuestion][0],
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
    answers.add(const SizedBox(
      height: 30,
    ));
    for (int i = 0; i < questions[currQuestion].length - 1; i++) {
      answers.add(
        OutlinedButton(
          onPressed: () {
            if (actualAnswers.length >= questions.length - 1) {
              widget.submit(i);
              Navigator.pushNamed(context, '/results');
            } else {
              actualAnswers.add(i);
              widget.submit(i);
              setState(nextQuestion);
            }
          },
          style: ButtonStyle(
            minimumSize:
                WidgetStateProperty.all(const Size(double.infinity, 50)),
            backgroundColor:
                WidgetStateProperty.all(const Color.fromARGB(255, 88, 0, 147)),
          ),
          child: Text(questions[currQuestion][i + 1],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ),
      );
      answers.add(const SizedBox(
        height: 10,
      ));
    }
    return answers;
  }

  void nextQuestion() {
    if (currQuestion < questions.length - 1) {
      currQuestion++;
    }
  }

  @override
  void initState() {
    super.initState();
    currQuestion = 0;
    questions = widget.questions;
    rightAnswer = widget.rightAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 0, 135),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildAnswers(),
          ),
        ),
      ),
    );
  }
}
