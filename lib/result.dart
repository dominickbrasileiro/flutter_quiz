import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function onRestart;

  Result({this.score, this.onRestart});

  String get result {
    if (score < 15) {
      return 'Are you serious?';
    } else if (score < 20) {
      return 'Not bad...';
    } else if (score < 25) {
      return 'On fire!!!';
    } else {
      return 'Badass!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '$score/30',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            child: Text('Restart'),
            onPressed: onRestart,
          ),
        ],
      ),
    );
  }
}
