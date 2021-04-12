import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  final String title;
  final double titleSize;
  final String placeholder;
  final double width;
  final IconData icon;
  final double iconSize;
  final String iconPosition;
  final bool hasBottomSpace;
  final List<String> items;
  Function function;

  CustomDropDown({
    Key key,
    this.title,
    this.titleSize = 18,
    this.placeholder,
    this.width,
    this.icon,
    this.iconSize = 14,
    this.iconPosition = 'prefix',
    this.hasBottomSpace = true,
    this.items,
    this.function,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
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
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 30,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      iconSize: 30,
                      value: widget.placeholder,
                      onChanged: widget.function,
                      items: widget.items.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 12),
                          ),
                        );
                      }).toList()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
