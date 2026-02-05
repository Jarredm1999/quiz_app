import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/models/app_screens.dart';
import 'package:quiz_app/quiz_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function(Screen screenName) startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/quiz-logo.png', 
            height: 300, 
            color: const Color.fromARGB(139, 0, 0, 0)
          ),
          SizedBox(height: 80,),
          QuizText(
            'Learn Flutter the fun way!', 
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black,),
            onPressed: () => startQuiz(Screen.quizScreen), 
            icon: const Icon(Icons.arrow_right_alt),
            label: QuizText("Button", textStyle: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
