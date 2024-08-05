import 'package:flutter/material.dart';
import 'package:quiz_app/Trial2/questions.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion(this.questionIndex, this.onTap, {super.key});
  final int questionIndex;
  final void Function(String answer) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(questions[questionIndex].questionText,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 30),
          ...questions[questionIndex].shuffledAnswers.map((answer) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    onTap(answer);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 56, 0, 93),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(double.infinity, 60)),
                  child: Text(answer),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
