import 'package:apex_weapons/providers/providers.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCheckBox extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final double titleSize;
  final String placeholder;
  final double width;
  final bool hasBottomSpace;
  final String checkBoxType;

  const CustomCheckBox({
    Key key,
    this.controller,
    this.title,
    this.titleSize = 18,
    this.placeholder,
    this.width,
    this.hasBottomSpace = false,
    this.checkBoxType,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final weaponProvider = watch(weaponCNP);
        return SizedBox(
          height: widget.hasBottomSpace ? 127 : 107,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Table(
              defaultColumnWidth: FixedColumnWidth(130.0),
              children: [
                TableRow(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Color.fromRGBO(34, 42, 52, 1),
                                fontSize: widget.titleSize,
                                fontFamily: 'Barlow-Medium'),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Checkbox(
                        checkColor: black,
                        activeColor: primary,
                        value: widget.checkBoxType.contains('hasHopUp')
                            ? weaponProvider.hasHopUp
                            : weaponProvider.isSupplyDropWeapon,
                        onChanged: (bool value) {
                          setState(() {
                            currentValue = value;
                          });
                          if (widget.checkBoxType.contains('hasHopUp')) {
                            weaponProvider.updateHasHopUp(
                                hasHopUp: currentValue);
                          } else if (widget.checkBoxType
                              .contains('isSupplyDropWeapon')) {
                            weaponProvider.updateIsSupplyDropWeapon(
                                isSupplyDropWeapon: currentValue);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
