import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText.large(this.text, {super.key}) : fontSize = 24.0;

  AppText.medium(this.text, {super.key}) : fontSize = 20.0;

  AppText.small(this.text, {super.key}) : fontSize = 18.0;

  AppText.boldLarge(this.text, {super.key})
      : fontSize = 24.0,
        fontWeight = FontWeight.bold;

  AppText.boldMedium(this.text, {super.key})
      : fontSize = 20.0,
        fontWeight = FontWeight.bold;

  AppText.boldSmall(this.text, {super.key})
      : fontSize = 18.0,
        fontWeight = FontWeight.bold;

  final double fontSize;
  final String text;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.black),
    );
  }
}
