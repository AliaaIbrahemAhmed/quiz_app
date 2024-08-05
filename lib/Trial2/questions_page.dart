import 'package:flutter/widgets.dart';
import 'package:quiz_app/Trial2/questions.dart';
import 'package:quiz_app/Trial2/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.answerQuestion, this.navigateToResults,
      {super.key});
  final void Function(String answer) answerQuestion;
  final void Function() navigateToResults;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion(String answer) {
    widget.answerQuestion(answer);
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex > questions.length - 1) {
        widget.navigateToResults();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QuizQuestion(currentQuestionIndex, nextQuestion),
    );
  }
}
