import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/quiz_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: data['user_answer'] == data['correct_answer']
                      ? Color.fromARGB(255, 1, 112, 51)
                      : Color.fromARGB(255, 112, 1, 92),
                  child: QuizText(
                    ((data['question_index'] as int) + 1).toString(),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      QuizText(
                        data['question'] as String,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      QuizText(
                        data['user_answer'] as String,
                        textStyle: TextStyle(
                          color: const Color.fromARGB(255, 1, 112, 51),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      QuizText(
                        data['correct_answer'] as String,
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 110, 0, 253),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
