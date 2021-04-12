import 'package:flutter/material.dart';

class HeadingOne extends StatelessWidget {
  final String text;
  final Color color;

  const HeadingOne({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 34,
        color: color,
        fontFamily: 'Barlow-Medium',
      ),
    );
  }
}
