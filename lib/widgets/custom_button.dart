import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String type;
  final String variant;
  final double fontSize;
  final IconData icon;
  final Function onPressed;
  final double width;
  final double height;
  final double radius;
  final bool disable;

  const CustomButton(
      {Key key,
      this.text,
      this.type,
      this.variant,
      this.fontSize,
      this.icon,
      this.onPressed,
      this.width,
      this.height,
      this.radius = 4,
      this.disable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: variant.contains('medium-icon')
          ? CustomIconButton(
              text: text,
              type: type,
              fontSize: fontSize,
              icon: icon,
              onPressed: onPressed,
              width: width,
              height: height,
              radius: radius,
              disable: disable,
            )
          : CustomNonIconButton(
              text: text,
              type: type,
              fontSize: fontSize,
              variant: variant,
              onPressed: onPressed,
              width: width,
              height: height,
              radius: radius,
              disable: disable,
            ),
    );
  }
}

// Button Layout to display if there is no icon given
class CustomNonIconButton extends StatelessWidget {
  final String text;
  final String type;
  final String variant;
  final double fontSize;
  final Function onPressed;
  final double width;
  final double height;
  final double radius;
  final bool disable;

  const CustomNonIconButton(
      {Key key,
      this.text,
      this.type,
      this.variant,
      this.fontSize,
      this.onPressed,
      this.width,
      this.height,
      this.radius = 4,
      this.disable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable
          ? null
          : () {
              onPressed();
            },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(
            width ?? 10,
            variant.contains('large')
                ? height ?? 48
                : variant.contains('medium')
                    ? height ?? 40
                    : height ?? 26)),
        // manipulate backgroundColor against mouse events
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 0.76)
                  : Color.fromRGBO(218, 218, 218, 0.76);
            } else if (states.contains(MaterialState.hovered)) {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 0.92)
                  : Color.fromRGBO(218, 218, 218, 0.92);
            } else if (states.contains(MaterialState.disabled)) {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 0.50)
                  : Color.fromRGBO(218, 218, 218, 0.50);
            } else {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 1)
                  : Color.fromRGBO(218, 218, 218, 1);
            }
          },
        ),
        padding: MaterialStateProperty.all(
          variant.contains('large')
              ? EdgeInsets.symmetric(horizontal: 45.5, vertical: 13)
              : variant.contains('medium')
                  ? EdgeInsets.symmetric(horizontal: 45.5, vertical: 13)
                  : EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        ),
        // manipulate text against mouse event. disable is not fixed
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return TextStyle(
                  fontSize: variant.contains('large')
                      ? fontSize ?? 18
                      : fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 0.76));
            } else if (states.contains(MaterialState.hovered)) {
              return TextStyle(
                  fontSize: variant.contains('large')
                      ? fontSize ?? 18
                      : fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 0.92));
            } else if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                  fontSize: variant.contains('large')
                      ? fontSize ?? 18
                      : fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 0.5));
            } else {
              return TextStyle(
                  fontSize: variant.contains('large')
                      ? fontSize ?? 18
                      : fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 1));
            }
          },
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Barlow-Regular',
        ),
      ),
    );
  }
}

// Button Layout to display if there is an icon given
class CustomIconButton extends StatelessWidget {
  final String text;
  final String type;
  final double fontSize;
  final IconData icon;
  final Function onPressed;
  final double width;
  final double height;
  final double radius;
  final bool disable;

  const CustomIconButton(
      {Key key,
      this.text,
      this.type,
      this.fontSize,
      this.icon,
      this.onPressed,
      this.width,
      this.height,
      this.radius = 4,
      this.disable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: disable
          ? null
          : () {
              onPressed();
            },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width ?? 10, height ?? 40)),
        // manipulate backgroundColor against mouse events
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 0.76)
                  : Color.fromRGBO(218, 218, 218, 0.76);
            } else if (states.contains(MaterialState.hovered)) {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 0.92)
                  : Color.fromRGBO(218, 218, 218, 0.92);
            } else if (states.contains(MaterialState.disabled)) {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 0.50)
                  : Color.fromRGBO(218, 218, 218, 0.50);
            } else {
              return type.contains('primary')
                  ? Color.fromRGBO(10, 176, 241, 1)
                  : Color.fromRGBO(218, 218, 218, 1);
            }
          },
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 29, vertical: 12)),
        // manipulate text against mouse event. disable is not fixed
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return TextStyle(
                  fontSize: fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 0.76));
            } else if (states.contains(MaterialState.hovered)) {
              return TextStyle(
                  fontSize: fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 0.92));
            } else if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                  fontSize: fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 0.5));
            } else {
              return TextStyle(
                  fontSize: fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 1));
            }
          },
        ),
      ),
      label: Text(
        text,
        style: TextStyle(
          fontFamily: 'Barlow-Regular',
        ),
      ),
      icon: Icon(
        icon,
        size: 14,
      ),
    );
  }
}
