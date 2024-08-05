import 'package:flutter/material.dart';
import 'package:quiz_app/Trial2/questions_page.dart';
import 'package:quiz_app/Trial2/results_page.dart';
import 'package:quiz_app/Trial2/welcome_page.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() {
    return _ScreenControllerState();
  }
}

class _ScreenControllerState extends State<ScreenController> {
  late String activeScreen;
  late Widget activeWidget;
  final List<String> actualAnswers = [];
  void navigateToQuestions() {
    setState(() {
      actualAnswers.clear();
      activeScreen = 'questions';
      activeWidget = QuestionsScreen(answerQuestion, navigateToResults);
    });
  }

  void navigateToResults() {
    setState(() {
      activeScreen = 'results';
      activeWidget = Results(actualAnswers, navigateToQuestions);
    });
  }

  void answerQuestion(String answer) {
    actualAnswers.add(answer);
  }

  @override
  void initState() {
    super.initState();
    activeScreen = 'home';
    activeWidget = WelcomePage(navigateToQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return activeWidget;
  }
}
