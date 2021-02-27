import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/result.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  final List<Map<String, Object>> questions = const [
    {
      'text': 'Which of the colors below is your favorite?',
      'answers': [
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 2},
        {'text': 'Blue', 'score': 7},
        {'text': 'Black', 'score': 10},
      ],
    },
    {
      'text': 'Which of the animals below is your favorite?',
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'text': 'Which of the developers below is the best?',
      'answers': [
        {'text': 'Michel Teló', 'score': 8},
        {'text': 'Lucas Desmontano', 'score': 8},
        {'text': 'Dominick Brasileiro', 'score': 10},
        {'text': 'Lino Tornados', 'score': 8},
      ],
    },
  ];

  int _selectedQuestion = 0;
  int _totalScore = 0;

  void _handleAnswer(int score) {
    setState(() {
      _selectedQuestion++;
      _totalScore += score;
    });
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _selectedQuestion < questions.length
            ? Quiz(
                questions: questions,
                selectedQuestion: _selectedQuestion,
                onAnswer: _handleAnswer,
              )
            : Result(
                score: _totalScore,
                onRestart: _restartQuiz,
              ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
