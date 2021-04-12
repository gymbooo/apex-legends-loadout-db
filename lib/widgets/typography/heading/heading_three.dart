import 'package:flutter/material.dart';

class HeadingThree extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const HeadingThree(
      {Key key, @required this.text, @required this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            height: 0.5,
            fontSize: size,
            fontFamily: 'Barlow-Regular',
            color: color));
  }
}
