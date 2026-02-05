import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/quiz_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build (BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style:ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        foregroundColor: Colors.white, 
        backgroundColor: const Color.fromARGB(255, 1, 112, 51),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(40),
        ),
      ),
      child: QuizText(
        answerText, 
        textStyle: TextStyle(
          fontWeight: FontWeight.bold), 
          textAlign: TextAlign.center,
      ),
    );
  }
}