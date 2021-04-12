import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final String weight;

  const CustomText({
    Key key,
    this.text,
    this.color,
    this.size,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size,
            fontFamily: weight.contains('medium')
                ? 'Barlow-Medium'
                : weight.contains('bold')
                    ? 'Barlow-Bold'
                    : 'Barlow-Regular',
            color: color));
  }
}
