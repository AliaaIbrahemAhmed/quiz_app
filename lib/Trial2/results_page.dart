import 'package:flutter/material.dart';
import 'package:quiz_app/Trial2/question_result.dart';
import 'package:quiz_app/Trial2/questions.dart';

class Results extends StatelessWidget {
  Results(this.actualAnswers, this.navigateToQuestions, {super.key})
      : correctAnswers = actualAnswers.where((ans) {
          return ans == questions[actualAnswers.indexOf(ans)].answers[0];
        }).length;
  final List<String> actualAnswers;
  final int correctAnswers;
  final void Function() navigateToQuestions;

  Widget questionsResult() {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...questions.map(
              (question) {
                int questionIndex = questions.indexOf(question);
                return Column(
                  children: [
                    QuestionResult(
                        actualAnswers[questionIndex],
                        actualAnswers[questionIndex] == question.answers[0],
                        questionIndex),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You have answerd $correctAnswers out of ${questions.length} questions corectly!",
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          questionsResult(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: navigateToQuestions,
            label: const Text("Restart Quiz"),
            icon: const Icon(Icons.restart_alt),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 56, 0, 93),
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
