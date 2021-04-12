import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color color;

  const BodyText({Key key, @required this.text, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: 14.0, fontFamily: 'Barlow-Regular', color: color));
  }
}
