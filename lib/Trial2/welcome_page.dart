import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage(this.onPressed, {super.key});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 350,
            height: 350,
            color: const Color.fromARGB(118, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 81, 0, 135)),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
