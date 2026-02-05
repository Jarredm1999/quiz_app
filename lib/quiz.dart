import 'package:flutter/material.dart';

import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/models/app_screens.dart';

class Quiz extends StatefulWidget { 
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers, switchScreen);
      });
    }
  }

  void switchScreen(Screen screenName) {
    switch(screenName) {
      case Screen.startScreen:
        activeScreen = StartScreen(switchScreen);
      case Screen.quizScreen:
        activeScreen = QuestionsScreen(chooseAnswer);
      case Screen.resultsScreen:
        activeScreen = ResultsScreen(selectedAnswers, switchScreen);
    }
    setState(() {
      activeScreen;
      if (screenName == Screen.quizScreen) {
        selectedAnswers.clear();
      }
    });
  }

  @override
  Widget build(BuildContext build) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(248, 16, 213, 128),
                Color.fromARGB(255, 0, 100, 52),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}