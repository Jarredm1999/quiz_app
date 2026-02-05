import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_text.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    required this.isCorrectAnswer,
    required this.questionIndex,
    super.key,
  });

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? Color.fromARGB(255, 1, 112, 51)
            : Color.fromARGB(255, 112, 1, 92),
        borderRadius: BorderRadius.circular(100),
      ),
      child: QuizText(
        questionIndex.toString(),
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
