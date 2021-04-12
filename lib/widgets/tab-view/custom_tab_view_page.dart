import 'package:apex_weapons/pages/edit_weapon.dart';
import 'package:apex_weapons/providers/providers.dart';
import 'package:apex_weapons/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabViewPage extends StatefulWidget {
  final String id;
  final String gunId;
  final String gunTypeName;
  final String weaponName;
  final String description;
  final String imageUrl;
  final String fireModeId;
  final String fireMode;
  final String ammoTypeId;
  final String ammoType;
  final int rateOfFire;
  final int headDamage;
  final int bodyDamage;
  final int legsArmsDamage;
  final int baseMagSize;
  final bool withHopUp;
  final bool isSupplyDropWeapon;

  const CustomTabViewPage({
    Key key,
    this.id,
    this.gunId,
    this.weaponName,
    this.description,
    this.imageUrl,
    this.fireMode,
    this.ammoType,
    this.rateOfFire,
    this.headDamage,
    this.bodyDamage,
    this.legsArmsDamage,
    this.baseMagSize,
    this.withHopUp,
    this.isSupplyDropWeapon,
    this.fireModeId,
    this.ammoTypeId,
    this.gunTypeName,
  }) : super(key: key);
  @override
  _CustomTabViewPageState createState() => _CustomTabViewPageState();
}

class _CustomTabViewPageState extends State<CustomTabViewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final listOfWeaponTypesProvider = watch(listOfWeaponTypesCNP);
        final listOfAmmoTypeProvider = watch(listOfAmmoTypeCNP);
        final listOfFireModeProvider = watch(listOfFireModeCNP);
        final weaponProvider = watch(weaponCNP);
        List<String> _ammoTypeList = [];
        List<String> _fireModeList = [];
        List<String> _weaponTypeList = [];

        return Container(
          decoration: BoxDecoration(
            color: widget.ammoType.contains('Light Rounds')
                ? Color(0xffffe0b2)
                : widget.ammoType.contains('Heavy Rounds')
                    ? Color(0xffb2ded4)
                    : widget.ammoType.contains('Shotgun Shells')
                        ? Color(0xffffb2b2)
                        : widget.ammoType.contains('Energy Ammo')
                            ? Color(0xffebffb2)
                            : Color(0xffb2b3ff),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit_rounded,
                      color: black,
                    ),
                    onPressed: () async {
                      await listOfWeaponTypesProvider.getListOfWeaponTypes();
                      await listOfAmmoTypeProvider.getListOfAmmoType();
                      await listOfFireModeProvider.getListOfFireMode();

                      listOfAmmoTypeProvider.listofAmmoType.forEach((element) {
                        _ammoTypeList.add(element.ammoType);
                      });
                      listOfFireModeProvider.listOfFireMode.forEach((element) {
                        _fireModeList.add(element.fireMode);
                      });
                      listOfWeaponTypesProvider.listofWeaponTypes
                          .forEach((element) {
                        _weaponTypeList.add(element.gunType);
                      });

                      listOfAmmoTypeProvider.setListOfAmmoTypeString(
                          listOfAmmoTypeString: _ammoTypeList);
                      listOfFireModeProvider.setListOfFireModeString(
                          listOfListOfFireModeString: _fireModeList);
                      listOfWeaponTypesProvider.setListOfWeaponTypesString(
                          listOfWeaponTypesString: _weaponTypeList);

                      weaponProvider.clearForm();

                      weaponProvider.setWeaponType(weaponType: widget.gunId);
                      weaponProvider.setWeaponTypeName(
                          weaponTypeName: widget.gunTypeName);
                      weaponProvider.setAmmoType(ammoType: widget.ammoType);
                      weaponProvider.setAmmoTypeId(
                          ammoTypeId: widget.ammoTypeId);
                      weaponProvider.setFireMode(fireMode: widget.fireMode);
                      weaponProvider.setFireModeId(
                          fireModeId: widget.fireModeId);
                      weaponProvider.updateHasHopUp(hasHopUp: widget.withHopUp);
                      weaponProvider.updateIsSupplyDropWeapon(
                          isSupplyDropWeapon: widget.isSupplyDropWeapon);
                      weaponProvider.setWeaponID(weaponID: widget.id);
                      weaponProvider.setWeaponName(
                          weaponName: widget.weaponName);
                      weaponProvider.setDescription(
                          description: widget.description);
                      weaponProvider.setimageUrl(imageUrl: widget.imageUrl);
                      weaponProvider.setRateOfFire(
                          rateOfFire: widget.rateOfFire.toString());
                      weaponProvider.setHeadDamage(
                          headDamage: widget.headDamage.toString());
                      weaponProvider.setBodyDamage(
                          bodyDamage: widget.bodyDamage.toString());
                      weaponProvider.setArmsLegDamage(
                          armsLegDamage: widget.legsArmsDamage.toString());
                      weaponProvider.setBaseMagSize(
                          baseMagSize: widget.baseMagSize.toString());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditWeaponPage()),
                      );
                    },
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    widget.imageUrl,
                    width: widget.gunId == '1' ? 150 : 250,
                  ),
                ),
                Spacer(),
                Table(
                  defaultColumnWidth: FixedColumnWidth(170.0),
                  columnWidths: {
                    0: FlexColumnWidth(8),
                    1: FlexColumnWidth(10),
                  },
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      width: 1,
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  children: [
                    _dataRow(
                      title: 'Weapon Name',
                      value: widget.weaponName,
                    ),
                    _dataRow(
                      title: 'Description',
                      value: widget.description,
                    ),
                    _dataRow(
                      title: 'Fire Mode',
                      value: widget.fireMode,
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'Ammo Type',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Image.network(
                                widget.ammoType.contains('Light Rounds')
                                    ? 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/a/a5/Light_Rounds.svg/revision/latest/scale-to-width-down/160?cb=20190827144754'
                                    : widget.ammoType.contains('Heavy Rounds')
                                        ? 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/5/55/Heavy_Rounds.svg/revision/latest/scale-to-width-down/160?cb=20190827144859'
                                        : widget.ammoType
                                                .contains('Shotgun Shells')
                                            ? 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/4/42/Shotgun_Shells.svg/revision/latest/scale-to-width-down/160?cb=20190827163750'
                                            : widget.ammoType
                                                    .contains('Energy Ammo')
                                                ? 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/2/2d/Energy_Ammo.svg/revision/latest/scale-to-width-down/160?cb=20190827163648'
                                                : 'https://static.wikia.nocookie.net/apexlegends_gamepedia_en/images/3/3e/Sniper_Ammo.svg/revision/latest/scale-to-width-down/160?cb=20200207225134',
                                width: 20,
                              ),
                              Text(
                                widget.ammoType,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    _dataRow(
                      title: 'Rate Of Fire',
                      value: widget.rateOfFire.toString() + ' RPM',
                    ),
                    _dataRow(
                      title: 'Head Damage',
                      value: widget.bodyDamage.toString(),
                    ),
                    _dataRow(
                      title: 'Body Damage',
                      value: widget.bodyDamage.toString(),
                    ),
                    _dataRow(
                      title: 'Legs & Arms Damage',
                      value: widget.legsArmsDamage.toString(),
                    ),
                    _dataRow(
                      title: 'Base Mag Size',
                      value: widget.baseMagSize.toString(),
                    ),
                    _dataRow(
                      title: 'With Hop Up?',
                      value: widget.withHopUp ? 'Yes' : 'None',
                    ),
                    _dataRow(
                      title: 'Is Supply Drop Weapon?',
                      value: widget.isSupplyDropWeapon ? 'Yes' : 'No',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TableRow _dataRow({String title, String value}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            value,
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
