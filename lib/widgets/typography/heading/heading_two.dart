import 'package:flutter/material.dart';

class HeadingTwo extends StatelessWidget {
  final String text;
  final Color color;

  const HeadingTwo({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28,
        color: color,
        fontFamily: 'Barlow-Medium',
      ),
    );
  }
}
