import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizText extends StatelessWidget {
  const QuizText(this.quizText, {this.textStyle = const TextStyle(), this.textAlign = TextAlign.start, super.key});

  final String quizText;
  final TextStyle textStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      quizText,
      style: GoogleFonts.courierPrime(textStyle: textStyle),
      textAlign: textAlign,
    );
  }
}
