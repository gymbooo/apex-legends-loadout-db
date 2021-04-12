import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final String title;

  const CustomLogo({
    Key key,
    this.title = 'Loadout Database',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://i.redd.it/1kxnu79d9q841.png',
          width: 70,
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
