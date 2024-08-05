import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult(this.num, this.correct, this.question, {super.key})
      : color = correct
            ? const Color.fromARGB(124, 0, 255, 8)
            : const Color.fromARGB(124, 255, 17, 0);

  final Color color;
  final bool correct;
  final int num;
  final Widget Function(int num) question;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            width: 20,
            height: 20,
            child: Center(
              child: Text(
                num.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Center(child: question(num)),
        ],
      ),
    );
  }
}
