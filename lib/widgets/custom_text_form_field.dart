import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final double titleSize;
  final String placeholder;
  final double width;
  final IconData icon;
  final double iconSize;
  final String iconPosition;
  final bool hasBottomSpace;
  final bool isNumberField;
  final bool isURLField;

  const CustomTextFormField({
    Key key,
    this.controller,
    this.title,
    this.titleSize = 18,
    this.placeholder,
    this.width,
    this.icon,
    this.iconSize = 14,
    this.iconPosition = 'prefix',
    this.hasBottomSpace = true,
    this.isNumberField = false,
    this.isURLField = false,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.hasBottomSpace ? 127 : 107,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
                color: Color.fromRGBO(34, 42, 52, 1),
                fontSize: widget.titleSize,
                fontFamily: 'Barlow-Medium'),
          ),
          SizedBox(
            height: 27,
          ),
          SizedBox(
            width: widget.width,
            height: _isEmpty ? 58 : 36,
            child: TextFormField(
              maxLines: 1,
              keyboardType: widget.isNumberField
                  ? TextInputType.number
                  : widget.isNumberField
                      ? TextInputType.url
                      : TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(500),
                widget.isNumberField
                    ? FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    : FilteringTextInputFormatter.allow(RegExp(r'.*')),
              ],
              controller: widget.controller,

              validator: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _isEmpty = true;
                  });
                  return '*${widget.placeholder} is Required';
                }
                setState(() {
                  _isEmpty = false;
                });
                return null;
              },
              // decoration properties
              style: TextStyle(
                color: Color.fromRGBO(42, 45, 49, 1),
                fontSize: 14,
                fontFamily: 'Barlow-Regular',
              ),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                isDense: true,
                errorStyle: TextStyle(
                  color: Color.fromRGBO(235, 33, 33, 1),
                  fontFamily: 'Barlow-Regular',
                  fontStyle: FontStyle.italic,
                  fontSize: 11,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: widget.iconSize + (40 - widget.iconSize),
                  maxWidth: widget.iconSize + (40 - widget.iconSize),
                ),
                prefixIcon:
                    (widget.icon != null && widget.iconPosition == 'prefix')
                        ? Icon(
                            widget.icon,
                            size: widget.iconSize,
                            color: Color.fromRGBO(10, 176, 241, 1),
                          )
                        : null,
                suffixIconConstraints: BoxConstraints(
                  minWidth: widget.iconSize + (40 - widget.iconSize),
                  maxWidth: widget.iconSize + (40 - widget.iconSize),
                ),
                suffixIcon:
                    (widget.icon != null && widget.iconPosition == 'suffix')
                        ? Icon(
                            widget.icon,
                            size: widget.iconSize,
                            color: Color.fromRGBO(10, 176, 241, 1),
                          )
                        : null,
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(155, 155, 155, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Barlow-Regular',
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(218, 218, 218, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(10, 176, 241, 1),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(255, 102, 102, 1),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(255, 102, 102, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
