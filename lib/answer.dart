import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String value;

  final void Function() whenSelected;

  Answer(this.value, this.whenSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(value),
        onPressed: whenSelected,
      ),
    );
  }
}
