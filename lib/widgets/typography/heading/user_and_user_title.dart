import 'package:flutter/material.dart';

class UserAndUserTitle extends StatelessWidget {
  final String text;
  final Color color;

  const UserAndUserTitle({Key key, @required this.text, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: 8.0, fontFamily: 'Barlow-Regular', color: color));
  }
}
