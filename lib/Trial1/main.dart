import 'package:flutter/material.dart';
import 'package:quiz_app/Trial1/question_page.dart';
import 'package:quiz_app/Trial1/welcome_page.dart';

import 'results_page.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});
  final List<int> actualAnswers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
          backgroundColor: Color.fromARGB(255, 81, 0, 135),
          body: WelcomePage()),
      routes: {
        //'/': (context) => const WelcomePage(),
        '/questions': (context) => _buildQuestionPage(context),
        '/results': (context) => _buildAnswerPage(context),
      },
    );
  }

  void submit(int ans) {
    actualAnswers.add(ans);
  }

  Widget _buildAnswerPage(BuildContext context) {
    return Results(actualAnswers, rightAnswers, questions);
  }

  Widget _buildQuestionPage(BuildContext context) {
    return QuestionPage(submit, questions, rightAnswers);
  }

  List<List<String>> questions = [
    ['What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome'],
    ['What is 2 + 2?', '3', '4', '5', '6'],
    [
      'Which planet is known as the Red Planet?',
      'Earth',
      'Mars',
      'Jupiter',
      'Venus'
    ],
    [
      'Who wrote "Romeo and Juliet"?',
      'William Shakespeare',
      'Charles Dickens',
      'Mark Twain',
      'Jane Austen'
    ],
    [
      'What is the largest ocean on Earth?',
      'Atlantic Ocean',
      'Indian Ocean',
      'Arctic Ocean',
      'Pacific Ocean'
    ]
  ];

// Indices of correct answers (0-based index)
  List<int> rightAnswers = [
    2, // 'Paris' is the correct answer for the first question
    1, // '4' is the correct answer for the second question
    1, // 'Mars' is the correct answer for the third question
    0, // 'William Shakespeare' is the correct answer for the fourth question
    3 // 'Pacific Ocean' is the correct answer for the fifth question
  ];
}
