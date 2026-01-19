import 'package:flutter/material.dart';
//import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  // int? lastQuestionIndex;
  Question? currentQuestion; 

  // @override
  // void initState() {
  //   currentQuestionIndex = changeAnswer();
  //   lastQuestionIndex = currentQuestionIndex;
  //   super.initState();
  // }

  void checkAnswer(String answer) {
    widget.onSelectAnswer(answer);
    // Random Logic.
    // var currentIndex = changeAnswer();
    // if (currentIndex == lastQuestionIndex) {
    //   currentIndex = changeAnswer();
    // }
    // lastQuestionIndex = currentIndex;
    setState(() {
      //currentQuestionIndex = currentIndex;
      currentQuestionIndex = changeAnswer();
    });
  }

  int changeAnswer() {
    //return math.Random().nextInt(questions.length);
    return currentQuestionIndex += 1;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex ?? 0];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.question,
            style: GoogleFonts.courierPrime(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((e) {
              return AnswerButton(e, () {
                checkAnswer(e);
              });
            }),
          ],
        ),
      ),
    );
  }
}