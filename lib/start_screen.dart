import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

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
          Text(
            'Learn Flutter the fun way!', 
            style: GoogleFonts.courierPrime(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black,),
            onPressed: startQuiz, 
            icon: const Icon(Icons.arrow_right_alt),
            label: Text("Button", style: GoogleFonts.courierPrime(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
