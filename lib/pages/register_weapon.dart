import 'package:apex_weapons/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterWeaponPage extends StatefulWidget {
  final bool fromHomePage;

  const RegisterWeaponPage({
    Key key,
    this.fromHomePage = false,
  }) : super(key: key);
  @override
  _RegisterWeaponPageState createState() => _RegisterWeaponPageState();
}

class _RegisterWeaponPageState extends State<RegisterWeaponPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return WeaponForm(
          type: 'register',
          title: 'Register New Weapon',
          fromHomePage: widget.fromHomePage,
        );
      },
    );
  }
}
