import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/quiz_text.dart';
import 'package:quiz_app/models/app_screens.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.switchScreen, {super.key});

  final List<String> chosenAnswers;
  final void Function(Screen screenName) switchScreen; 

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuizText(
              'You answered $numCorrectQuestions out of $numTotalQuestions questsions correctly!',
              textAlign: TextAlign.center,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: () => switchScreen(Screen.quizScreen),
              icon: Icon(Icons.refresh),
              label: const QuizText('Restart Quiz!', textStyle: TextStyle()),
            ),
          ],
        ),
      ),
    );
  }
}
