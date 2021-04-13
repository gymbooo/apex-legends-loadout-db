import 'package:apex_weapons/widgets/widget.dart';
import 'package:flutter/material.dart';

class CustomConfirmModal extends StatelessWidget {
  final String icon;
  final String header;
  final String subHeaderOne;
  final String subHeaderTwo;
  final Color subHeaderColor;
  final Color headerColor;
  final String secondaryButtonText;
  final String primaryButtonText;
  final Function secondaryFunction;
  final Function primaryFunction;

  const CustomConfirmModal({
    Key key,
    this.icon,
    this.header,
    this.subHeaderOne,
    this.subHeaderTwo,
    this.subHeaderColor,
    this.headerColor,
    this.secondaryButtonText,
    this.primaryButtonText,
    this.primaryFunction,
    this.secondaryFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 441,
        height: subHeaderOne != null ? 345 : 300,
        child: Column(
          mainAxisAlignment: secondaryButtonText != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 98,
                  height: 98,
                  padding: EdgeInsets.only(bottom: 20),
                  child: icon.contains('positive')
                      ? Image(
                          image: AssetImage('lib/assets/images/octane.png'),
                          width: 200,
                        )
                      : icon.contains('negative')
                          ? Image(
                              image: AssetImage('lib/assets/images/pathy.png'),
                              width: 200,
                            )
                          : Image(
                              image:
                                  AssetImage('lib/assets/images/horizon.png'),
                              width: 200,
                            ),
                ),
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 16,
                    color: headerColor,
                    fontFamily: 'Barlow-Regular',
                  ),
                ),
                SizedBox(height: 14),
                if (subHeaderOne != null)
                  Text(
                    subHeaderOne,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffa3a4a5),
                      fontFamily: 'Barlow-Regular',
                    ),
                  ),
                SizedBox(height: 7),
                if (subHeaderTwo != null)
                  Text(
                    subHeaderTwo,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffa3a4a5),
                      fontFamily: 'Barlow-Regular',
                    ),
                  ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  secondaryButtonText != null
                      ? Container(
                          padding: EdgeInsets.only(bottom: 6),
                          child: CustomNonIconButton(
                            text: secondaryButtonText,
                            variant: 'small',
                            type: 'secondary',
                            fontSize: 12,
                            onPressed: () {
                              Navigator.of(context).pop();
                              secondaryFunction();
                            },
                            height: 33,
                            width: MediaQuery.of(context).size.width,
                            disable: false,
                          ),
                        )
                      : SizedBox(),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: CustomNonIconButton(
                      text: primaryButtonText,
                      variant: 'small',
                      type: 'primary',
                      fontSize: 12,
                      onPressed: () {
                        Navigator.of(context).pop();
                        primaryFunction();
                      },
                      width: MediaQuery.of(context).size.width,
                      height: 33,
                      disable: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
