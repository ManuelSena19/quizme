import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final answerTap;
  final Color answerColor;
  const Answer(
      {required this.answerText,
      required this.answerTap,
      required this.answerColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            color: answerColor,
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
