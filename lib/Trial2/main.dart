import 'package:flutter/material.dart';
import 'package:quiz_app/Trial2/controller.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 81, 0, 135),
        body: ScreenController(),
      ),
    );
  }
}
