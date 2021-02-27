import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final Function(int) onAnswer;

  const Quiz({
    @required this.questions,
    @required this.selectedQuestion,
    @required this.onAnswer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  List<Widget> get answersWidgets {
    if (hasSelectedQuestion) {
      List<Map<String, Object>> selectedQuestionAnswers =
          questions[selectedQuestion]['answers'];

      return selectedQuestionAnswers
          .map((answer) =>
              Answer(answer['text'], () => onAnswer(answer['score'])))
          .toList();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[selectedQuestion]['text']),
        ...answersWidgets,
      ],
    );
  }
}
