class Question {
  final String questionText;
  final List<String> answers;
  const Question(this.questionText, this.answers);

  List<String> get shuffledAnswers {
    List<String> shuffledAnswers = answers.toList()..shuffle();
    return shuffledAnswers;
  }
}
