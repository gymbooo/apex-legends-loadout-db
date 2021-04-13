import 'package:apex_weapons/widgets/widget.dart';
import 'package:flutter/material.dart';

class EditWeaponPage extends StatefulWidget {
  @override
  _EditWeaponPageState createState() => _EditWeaponPageState();
}

class _EditWeaponPageState extends State<EditWeaponPage> {
  @override
  Widget build(BuildContext context) {
    return WeaponForm(
      type: 'edit',
      title: 'Edit Weapon',
      fromHomePage: false,
    );
  }
}
